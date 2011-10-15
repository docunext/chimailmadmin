Chimailmadmin::Application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  resources :emails
  resources :servers
  resources :domains


  root :to => 'emails#index'

end
