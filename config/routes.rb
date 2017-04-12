Rails.application.routes.draw do
  root 'pages#home'

  namespace :api, defaults: { format: :json } do
    resources :feedbacks, only: [:create, :show]
  end
end
