Rails.application.routes.draw do
  root 'home#index'

  get 'start_task'  => "home#start_task"
  get 'client1'     => "home#client1"
  get 'client2'     => "home#client2"
end
