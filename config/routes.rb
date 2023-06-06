Rails.application.routes.draw do


#ユーザー用
  #URL /user/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #退会確認画面
  get '/users/:id/unsubscribe' => 'public/users#unsubscribe', as: 'unsubscribe'
  #論理削除用のルーティング
  patch '/users/:id/withdrawal' => 'public/users#withdrawal', as: 'withdrawal'

  root to: 'public/homes#top'
  scope module: :public do
    resources :posts, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    resources :users, only:[:show, :edit, :update, :unsubscribe, :withdrawal]
    resources :comments, only:[:create, :destroy]
    resources :favorites, only:[:create, :destroy]
    resources :searches, only:[:search]
  end


#管理者用
  #URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get '/admin' => 'admin/homes#top'
  namespace :admin do
    resources :posts, only:[:index, :show, :update]
    resources :comments, only:[:index, :show, :update]
    resources :users, only:[:index, :show, :edit, :update]
    resources :categories, only:[:index, :create, :edit, :update]
    resources :messages, only:[:index, :new, :create, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
