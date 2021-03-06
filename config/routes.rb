Rails.application.routes.draw do
  namespace :api do
    post 'user', to: 'user#create'
    patch 'user', to: 'user#update'
    delete 'user', to: 'user#destroy'
    get 'user/status', to: 'user#status'
    post 'user/login', to: 'user#login'

    get 'team/search', to: 'team#find_by'
    get 'team/:id/players', to: 'team#find_players'
    resources :team
    post 'team/add_player/:id/:player_id', to: 'team#add_player'
    delete 'team/add_player/:id/:player_id', to: 'team#remove_player'

    get 'player/search', to: 'player#find_by'
    get 'player/:id/teams', to: 'player#find_teams'
    resources :player

    get 'match/search', to: 'match#find_by'
    resources :match
  end

  get 'players/all', to: 'query#list_all_players'
  get 'players/:name', to: 'query#player_summary'
end
