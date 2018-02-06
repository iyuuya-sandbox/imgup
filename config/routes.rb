Rails.application.routes.draw do
  root 'images#new'
  post 'images' => 'images#create'

  scope :preview do
    get 'master' => 'preview#master'
  end
end
