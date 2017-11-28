Rails.application.routes.draw do
  devise_for :users

  namespace :admin do

    resources :cuadrillas
    resources :vias
    resources :empleados
    resources :recursos
    resources :tareas
    resources :programas

    resources :users

    root to: 'programas#index'
  end

  scope module: :public do
    # TODO: define routes
  end

  root to: 'public/site#index'
end
