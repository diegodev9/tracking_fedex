Rails.application.routes.draw do
  resources :trackings
  root to: "trackings#consulta"

  controller :trackings do
    :consulta
    :error
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
