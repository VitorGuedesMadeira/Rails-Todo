Rails.application.routes.draw do
  resources :todos
  delete "/delete_completed", to: "todos#delete_completed"
  root "todos#index"
end
