Rails.application.routes.draw do
  namespace :admin do
    get '/sign_in', to: 'sessions#new'
    post '/sign_in', to: 'sessions#create'

    resources :urls, only: [:index, :show, :destroy]
    delete '/destroy_no_click', to: "urls#destroy_with_two_months_no_click"

    root to: "urls#index"
  end

  get "/:short_url", to: "urls#show"

  namespace :api do
    resources :urls, only: [:index, :show, :create, :update, :destroy]
  end
end
