Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :companies, only: [:index, :create] do 
        resources :job_listings, except: [:show, :edit]
      end

      resources :job_listings, only: [:index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
