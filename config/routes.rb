Rails.application.routes.draw do


  namespace :public do
    get 'categories/index'
  end
  namespace :public do
    get 'messages/index'
  end
#ユーザー用
  #URL /user/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #退会確認画面
  get '/users/:id/unsubscribe' => 'public/users#unsubscribe', as: 'unsubscribe'
  #論理削除用
  patch '/users/:id/withdrawal' => 'public/users#withdrawal', as: 'withdrawal'


  #ログインユーザーの投稿一覧
  get '/posts/:id/mypage' => 'public/posts#mypage', as: 'mypage'


  root to: 'public/homes#top'
  scope module: :public do
    resources :posts, only:[:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :comments, only:[:create, :destroy]
      resource :favorites, only:[:create, :destroy]
      #下書き用  idは必要ないのでcollectionを使用
      collection do
        get 'confirm'
      end
    end
    #いいね一覧表示用
    resources :users, only:[:show, :edit, :update, :unsubscribe, :withdrawal] do
      member do
        get :favorites
      end
    end
    resources :searches, only:[:search]
    resources :messages, only:[:index]
  end


#管理者用
  #URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #１ユーザーの投稿一覧
  get 'admin/posts/:id/userpage' => 'admin/posts#userpage', as: 'userpage'

  #１ユーザーのコメント一覧
  get 'admin/comments/:id/commentpage' => 'admin/comments#commentpage', as: 'commentpage'

  get '/admin' => 'admin/homes#top'
  namespace :admin do
    resources :posts, only:[:index, :show, :update]
    resources :comments, only:[:index, :show, :update, :destroy]
    resources :users, only:[:index, :show, :edit, :update]
    resources :categories, only:[:index, :create, :edit, :update, :destroy]
    resources :messages, only:[:index, :new, :create, :edit, :update, :destroy]
  end

#ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
