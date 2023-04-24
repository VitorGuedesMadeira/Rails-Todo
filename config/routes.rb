Rails.application.routes.draw do
  resources :todos
  delete "/delete_completed", to: "todos#delete_completed"
  patch "/select_all", to: "todos#select_all"
  root "todos#index"
end
