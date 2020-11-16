Spree::Core::Engine.add_routes do
  namespace :admin do
    get '/analytics', to: 'analytics#index'
  end
end
