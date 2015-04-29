Rails.application.routes.draw do
  namespace :api do
    resources :items, except: [:new, :edit]
    resources :lists, except: [:new, :edit]
    resources :users, except: [:new, :edit]
  end
end
