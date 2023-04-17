Rails.application.routes.draw do
  
  
  post 'login', to: 'authentication#authenticate'

  namespace :api do
    namespace :v1 do
      resources :clients do
        collection do
          get 'sum_clients'
        end
        get 'animals', to: 'clients#client_animals'
        resources :animals, except: [:new, :edit]
      end
      resources :animals do
        collection do
          get 'sum_animals'
        end
      end      
      resources :services do
        collection do
          get 'newset'
          get 'sum_services'
          get 'sum_total_services'
        end
      end
    end
  end
end
