Rails.application.routes.draw do
  root 'pages#home'

  #Collection re-directed pages
  get 'products/index'
  get 'products/new'
  get 'products/edit'
  get 'products/women'
  get 'products/men'
  get 'products/kids'
  get 'products/newins'

  post 'saved_items' => "saved_items#create"

  resources :products
end

