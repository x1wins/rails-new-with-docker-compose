Rails.application.routes.draw do
  get 'shippings/autocomplete'
  resources :shippings
  resources :stores
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
