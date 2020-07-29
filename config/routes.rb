Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :robots
  resources :users
  resources :parts
  resources :moves
  resources :robot_parts
end
