Specerija::Application.routes.draw do

  devise_for :users

  resources :fridges do
    resources :fridge_items, :only => [:new, :create, :destroy]
  end

  resources :items

  root :to => 'fridges#index'
end
