Specerija::Application.routes.draw do
  resources :fridges do
    resources :items, :except => [:index]
  end

  root :to => 'fridges#index'
end
