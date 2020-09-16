Rails.application.routes.draw do
  namespace :api do
    resources :urls, only: [:index, :show, :create]
  end
end
