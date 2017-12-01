Rails.application.routes.draw do
  namespace :v1 do
    get '/concerts' => 'concerts#index'
  end
end
