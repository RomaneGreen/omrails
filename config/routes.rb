Rails.application.routes.draw do

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  
  as :user do
  get "signin",to: 'devise/sessions#new'
  get "signup" ,to: 'devise/registrations#new'
  delete "signout" ,to: 'devise/sessions#destroy'
  end
  get 'feed', to: 'feed#show'
ActiveAdmin.routes(self)
  resources :users,only: :show,param: :username do
    member do
      post 'follows' ,to: 'follows#create'
      delete 'unfollow',to: 'follows#destroy'
    end
  end
  resources :items do
    member do
     post 'vote',to: 'votes#create'
     delete 'unvote' ,to: 'votes#destroy'
    end
  end
  resources :tweets do
    resources :comments
end
  post 'create', to: 'comments#create'
  devise_for :views
  root 'pages#home'
  get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'


end
