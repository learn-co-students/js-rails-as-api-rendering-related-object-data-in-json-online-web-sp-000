Rails.application.routes.draw do
  resources :sightings
  resources :longitudes
  get '/birds' => 'birds#index'
end