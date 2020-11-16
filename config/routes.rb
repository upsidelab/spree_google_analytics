Spree::Core::Engine.add_routes do
  namespace :admin do
    get '/reports', to: 'reports#index'
  end
end
