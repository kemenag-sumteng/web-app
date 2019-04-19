Rails.application.routes.draw do
  root 'beranda#index'

  resources :pengguna
  resources :sessions, only: [:new, :create, :destroy]

  get 'mendaftar', to: 'pengguna#new', as: 'signup'
  get 'masuk', to: 'sessions#new', as: 'login'
  get 'keluar', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
