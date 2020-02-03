Rails.application.routes.draw do
  resources :logins, only: [:create]
  resources :eligible_voters
  resources :candidate_chosens
  resources :candidates
  resources :voters
  resources :users
  get '/my_voters', to: 'voters#see_eligible_voters'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
