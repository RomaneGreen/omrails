Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  get "signin",to: 'devise/sessions#new'
  get "signup" ,to: 'devise/registrations#new'
  delete "signout" ,to: 'devise/sessions#destroy'
  end
  get 'feed', to: 'feed#show'

  resources :users,only: :show,param: :username do
    member do
      post 'follows' ,to: 'follows#create'
      delete 'unfollow',to: 'follows#destroy'
    end
  end
  resources :items
  resources :tweets

  devise_for :views
  root 'pages#home'
  get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
end
