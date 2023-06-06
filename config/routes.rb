Rails.application.routes.draw do

  namespace :admin do
    get 'messages/index'
    get 'messages/new'
    get 'messages/create'
    get 'messages/edit'
    get 'messages/update'
    get 'messages/destroy'
  end
  namespace :admin do
    get 'categories/index'
    get 'categories/create'
    get 'categories/edit'
    get 'categories/update'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
    get 'comments/update'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
    get 'posts/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'searches/search'
  end
  namespace :public do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :public do
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/unsubscribe'
    get 'users/withdrawal'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/new'
    get 'posts/create'
    get 'posts/show'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
  end
  namespace :public do
    get 'homes/top'
  end
  #ユーザー用
  #URL /user/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者用
  #URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
