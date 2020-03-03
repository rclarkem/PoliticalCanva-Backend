Rails.application.routes.draw do
  resources :voter_interactions
  get '/my-voter-interactions', to: 'voter_interactions#my_voter_interactions'
  resources :logins, only: [:create]
  resources :eligible_voters, only: [:index, :create, :update, :destroy]
  get '/my-voters', to: 'eligible_voters#my_eligible_voters'
  get '/my-voters/:id', to: 'eligible_voters#show'
  # TODO: Custom route for addresses search canvassing => for the frontend
  # delete '/my_voters/:id', to: 'eligible_voters#destroy'
  resources :candidate_chosens
  resources :candidates
  resources :voters
  resources :users
  get '/my-users', to: 'users#my_users'
  # TODO Ask if its put or patch
  patch '/users/admin/edit', to: 'users#admin_update'
  patch '/users/:id/edit', to: 'users#not_admin_update'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
