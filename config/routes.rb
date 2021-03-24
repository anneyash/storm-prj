Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tasks #, only: [:create, :show, :update, :destroy]
      resources :projects #, except: [:show]
    end
  end
end
