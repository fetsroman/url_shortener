Rails.application.routes.draw do
  namespace :admin do
    resources :urls, only: [:index, :show, :destroy]

    root to: "urls#index"
  end

  get "/:short_url", to: "urls#show"

  namespace :api do
    resources :urls, only: [:index, :show, :create, :update, :destroy]
  end
end
