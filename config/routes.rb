Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:index, :show, :create, :destroy] do
  resources :arts
end
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html