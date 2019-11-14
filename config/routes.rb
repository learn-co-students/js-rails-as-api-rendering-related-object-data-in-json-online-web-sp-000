Rails.application.routes.draw do
  get '/birds' => 'birds#index'
  get '/sightings/:id' => 'sightings#show'
end
