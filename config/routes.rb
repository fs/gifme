Gifme::Application.routes.draw do
  resources :videos, only: [:new, :create, :show]
  root to: 'videos#new'
end
