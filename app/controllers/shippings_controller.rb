class ShippingsController < ApplicationController
  before_action :set_shipping, only: %i[ show edit update destroy ]

  def autocomplete
    @q = params[:q]
    @shippings = Shipping.full_text_search_for(@q).limit(10)
    render json: @shippings
  end

  # GET /shippings or /shippings.json
  def index
    @q = params[:q]
    @pagy, @shippings = pagy(Shipping.full_text_search_for(@q).order("shippings.id DESC").includes(:custom).includes(:order).includes(:parcel).includes(:to_address).includes(:from_address))
  end

  # GET /shippings/1 or /shippings/1.json
  def show
  end

  # GET /shippings/new
  def new
    @shipping = Shipping.new
    @shipping.build_custom
    @shipping.build_order
    @shipping.build_parcel
    @shipping.build_to_address
    @shipping.build_from_address
  end

  # GET /shippings/1/edit
  def edit
  end

  # POST /shippings or /shippings.json
  def create
    @shipping = Shipping.new(shipping_params)

    respond_to do |format|
      if @shipping.save
        format.html { redirect_to @shipping, notice: "Shipping was successfully created." }
        format.json { render :show, status: :created, location: @shipping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shippings/1 or /shippings/1.json
  def update
    respond_to do |format|
      if @shipping.update(shipping_params)
        format.html { redirect_to @shipping, notice: "Shipping was successfully updated." }
        format.json { render :show, status: :ok, location: @shipping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shippings/1 or /shippings/1.json
  def destroy
    @shipping.destroy
    respond_to do |format|
      format.html { redirect_to shippings_url, notice: "Shipping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping
      @shipping = Shipping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipping_params
      params.require(:shipping).permit(
          custom_attributes: [:customs_type, :recipient_type],
          order_attributes: [:weight, :order_number, :product_name, :count, :price, :hs_code],
          parcel_attributes: [:box_count, :memo, :status],
          to_address_attributes: [:owner_name, :ssn, :phone1, :phone2, :zipcode, :address1, :address2],
          from_address_attributes: [:owner_name, :ssn, :phone1, :phone2, :zipcode, :address1, :address2])
    end
end
