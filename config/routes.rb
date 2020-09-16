Rails.application.routes.draw do
  get "/:short_url", to: "urls#show"
  namespace :api do
    resources :urls, only: [:index, :show, :create, :update, :destroy]
  end
end
