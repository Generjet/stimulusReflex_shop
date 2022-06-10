Rails.application.routes.draw do
  resources :chats
  resources :todos
  root to: 'todos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
