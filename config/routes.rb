Rails.application.routes.draw do
  root 'images#new'
  post 'images' => 'images#create'

  scope :preview do
    get 'master' => 'preview#master'
    get 'test1' => 'preview#test1'
    get 'test2' => 'preview#test2'
  end

  namespace :api, format: :json do
    namespace :v1 do
      resources :images, only: :index
    end
  end
end
