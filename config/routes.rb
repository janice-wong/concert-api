Rails.application.routes.draw do
  namespace :v1 do
    get '/concerts' => 'concerts#index'
    get '/concerts/:id' => 'concerts#show'
    post '/concerts' => 'concerts#create'
    delete '/concerts/:id' => 'concerts#destroy'
  end
end
