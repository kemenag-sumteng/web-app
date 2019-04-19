Rails.application.routes.draw do
  root 'beranda#index'

  get			'signup',		to: 'pengguna#new'
  get			'login',		to: 'sessions#new',			as: 'login'
  post		'login',		to: 'sessions#create'
  delete	'logout',		to: 'sessions#destroy'
  resources :pengguna
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
