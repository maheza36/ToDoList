Rails.application.routes.draw do


root to: 'static_pages#index'
devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  registrations: 'users/registrations'
}

resources :homeworks do
  member do
    post :share
    # ... genera una ruta dentro de homeworks pero con el :id como el show, edit o destroy
  end
  #collection do
  # ... genera una ruta dentro de homeworks pero sin el :id como el new o el index o el create
  #end
end
resources :notebooks
resources :task_users

default_url_options :host => "http://localhost:3000/"

end
