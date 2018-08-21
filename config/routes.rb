Rails.application.routes.draw do

  get 'users/:username', to: 'users#show', as: 'user'
  resources :items
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  get "signin",to: 'devise/sessions#new'
  get "signup" ,to: 'devise/registrations#new'
  delete "signout" ,to: 'devise/sessions#destroy'
  end
  devise_for :views
  root 'pages#home'
  get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
end
