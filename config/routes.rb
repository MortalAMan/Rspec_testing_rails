Rails.application.routes.draw do
  root 'classrooms#index'


  resources :classrooms
  
end
