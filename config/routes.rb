Rails.application.routes.draw do
  
  
  post 'login', to: 'authentication#authenticate'

  namespace :api do
    namespace :v1 do
      resources :clients do
        get 'animals', to: 'clients#client_animals'
        resources :animals, except: [:new, :edit]
      end
      resources :animals
      resources :services
    end
  end
end
