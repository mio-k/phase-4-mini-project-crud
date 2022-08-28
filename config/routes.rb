Rails.application.routes.draw do
  resources :spices, only:[:index, :update, :destroy, :create ]
end
