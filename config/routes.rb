Rails.application.routes.draw do
  resources :shippings do
    get 'autocomplete', on: :collection
  end
  resources :stores
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
