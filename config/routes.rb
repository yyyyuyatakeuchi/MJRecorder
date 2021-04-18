Rails.application.routes.draw do
  root 'calculation#top'
  get 'calculation/top'
  get 'calculation/calculate'
  post 'calculation/calculate'
  get 'calculation/:id' => 'calculation#matchCount'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    #omniauth_callbacks: "users/omniauth_callbacks"
  }
  post 'score_record/create' => 'score_record#create'
  resources :calculation, only: [:create]
  resources :mypage, only: [:show]
  resources :score_record, only: [:create ,:destroy]
end
