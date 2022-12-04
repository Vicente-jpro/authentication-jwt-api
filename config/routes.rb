Rails.application.routes.draw do
  resources :posts, only: [:create, :index, :show]
end
