Rails.application.routes.draw do
  resources :candidate_chosens
  resources :candidates
  resources :voters
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
