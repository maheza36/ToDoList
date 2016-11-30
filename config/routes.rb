Rails.application.routes.draw do


root to: 'static_pages#index'
devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  registrations: 'users/registrations'
}

resources :homeworks
resources :notebooks

end
