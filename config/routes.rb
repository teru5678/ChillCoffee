Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users, only:[:index,:show,:edit]
  resources :shops, only:[:new,:index,:show,:create,:edit,:update,:destroy]
  resources :tags,  only:[:index,:show,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
