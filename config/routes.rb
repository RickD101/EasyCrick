Rails.application.routes.draw do
  namespace :api do
    post 'user', to: 'user#create'
    patch 'user', to: 'user#update'
    delete 'user', to: 'user#destroy'
    get 'user/status', to: 'user#status'
    post 'user/login', to: 'user#login'
  end

  get '*path', to: 'react#react_app', format: false
end
