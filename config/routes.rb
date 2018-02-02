Rails.application.routes.draw do
  root 'images#new'
  post 'images' => 'images#create'

  get 'preview' => 'preview#index'
end
