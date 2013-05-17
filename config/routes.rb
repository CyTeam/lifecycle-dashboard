LifecycleDashboard::Application.routes.draw do
  devise_for :users

  resources :projects

  root :to => 'projects#dashboard'
end
