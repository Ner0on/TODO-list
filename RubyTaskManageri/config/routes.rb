RubyTaskManager::Application.routes.draw do
  root 'task_manager#index'
  resources :task_manager

  
end
