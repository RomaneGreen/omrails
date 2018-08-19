Rails.application.routes.draw do

  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  get "signin" => 'devise/sessions#new'
  get "signup" => 'devise/registrations#new'
  delete "signout" => 'devise/sessions#destroy'
  end
  devise_for :views
  root 'pages#home'
  get 'about' => 'pages#about'
    get 'contact' => 'pages#contact'
end
