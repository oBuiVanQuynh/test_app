Rails.application.routes.draw do

  resources :countries do
    resources :cities
  end
end
