Rails.application.routes.draw do
  root 'welcome#index'
  get '/search', to: "search#index"

  namespace :api do
      namespace :v1 do
        resources :venues, only: [:index, :show, :destroy, :post]
      end
    end


end
