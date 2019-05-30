Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :messages
    resources :counters, only: [:index]
  end
end
