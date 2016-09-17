Rails.application.routes.draw do
  root to: "dashboard#index"

  namespace :v1, defaults: { format: "json" } do
    namespace :search do
      resources :products, only: %i(index)
    end

    resources :products, only: %i(show)
  end
end
