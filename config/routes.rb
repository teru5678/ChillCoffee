Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  #ゲストログインのためのルーティング
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only:[:index,:show] do
    get :bookmarks, on: :collection
  end
  resources :shops, only:[:new,:index,:show,:create,:edit,:update,:destroy] do
    resource :bookmarks, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :tags,  only:[:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
