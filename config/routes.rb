Rails.application.routes.draw do

  resources :articles
  resources :categroys
  get 'welcome/index'
  get 'users/signout'
  get 'users/login'
  get 'admin' => 'admins#admin'
  get 'signup' => 'users#signup'
  get 'login' => 'users#login'
  get 'collection' => 'articles#collection'
  post 'create_login_session' => 'users#create_login_session'
  get'removed' => 'welcome#removed', as: 'removed'
  delete 'logout' => 'users#logout'
  root 'welcome#index'
  resources :users
  post "send_code" => 'verify_code#send_code'
  get 'freezer' => 'welcome#freezer'
  get 'good' => 'welcome#good', as: 'good'
  get 'forage' => 'articles#forage'
  get 'cut' => 'articles#cut'
  get 'cancle' => 'welcome#canclegood', as: 'cancle'
  get 'classical' => 'welcome#classical'
  get 'find' => 'users#find'
  post 'find_password' => 'users#find_password'
  get 'get_categroy' => 'articles#get_categroy'
  mount RuCaptcha::Engine => "/rucaptcha"
  get 'some_articles/:id' => 'welcome#some_articles'
  get 'about' => 'welcome#about'

end
