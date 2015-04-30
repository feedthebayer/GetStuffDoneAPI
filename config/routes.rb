Rails.application.routes.draw do
  namespace :api do
    resources :users, except: [:new, :edit]
    resources :lists, except: [:new, :edit] do
      resources :items, except: [:new, :edit]
    end
  end
end
