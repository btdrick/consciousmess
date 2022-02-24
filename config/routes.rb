Rails.application.routes.draw do
  root 'ripples#index'
  resources :ripples, except: [:edit, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "*path" => redirect("/ripples")
end
