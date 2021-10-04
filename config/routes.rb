Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'

  get 'home/about' => 'homes#about'

  resources :users, except: [:new]

  resources :books, except: [:new] do
    resources :book_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

end
