Specerija::Application.routes.draw do

  devise_for :users

  resources :fridges do
    resources :fridge_items, :except => [:index, :show]
  end

  resources :items

  root :to => 'fridges#index'
end
