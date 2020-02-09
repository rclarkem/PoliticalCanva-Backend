Rails.application.routes.draw do
  resources :voter_interactions
  resources :logins, only: [:create]
  resources :eligible_voters, only: [:index, :create, :update]
  get '/my-voters', to: 'eligible_voters#my_eligible_voters'
  get '/my-voters/:id', to: 'eligible_voters#show'
  # TODO: Custom route for addresses search canvassing => for the frontend
  # delete '/my_voters/:id', to: 'eligible_voters#destroy'
  resources :candidate_chosens
  resources :candidates
  resources :voters
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
