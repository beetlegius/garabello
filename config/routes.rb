Rails.application.routes.draw do
  devise_for :users

  namespace :admin do

    resources :cips
    resources :productos do
      get :autocomplete, on: :collection
      get :stock, on: :collection#, defaults: { format: :csv }
    end
    resources :movimientos_entrada, path: 'entradas'
    resources :movimientos_salida, path: 'salidas'

    resources :cuadrillas
    resources :vias
    resources :empleados
    resources :recursos
    resources :tareas
    resources :programas

    namespace :reportes do
      get :tareas
      get :recursos
    end

    resources :tipos_programa

    resources :users

    root to: 'base#root'
  end

  scope module: :public do
    # TODO: define routes
  end

  root to: 'public/site#index'
end
