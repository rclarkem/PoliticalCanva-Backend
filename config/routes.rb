Rails.application.routes.draw do
  resources :logins, only: [:create]
  resources :eligible_voters, only: [:create, :update]
  get '/my_voters', to: 'eligible_voters#my_eligible_voters'
  get '/my_voters/:id', to: 'eligible_voters#show'
  # delete '/my_voters/:id', to: 'eligible_voters#destroy'
  resources :candidate_chosens
  resources :candidates
  resources :voters
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
