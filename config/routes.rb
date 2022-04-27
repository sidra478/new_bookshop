Rails.application.routes.draw do
  
  resources :books
  root 'books#index'
  get 'assign_tags' => 'books#assign_tags'
  post 'assign_book_tags' => 'books#assign_book_tags'



  devise_for :author, controllers: { registrations: 'author/registrations' }, path: 'accounts',
                       path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout',
                                     password: 'secret', confirmation: 'verification' }

  get 'logout_author' => 'author#logout_author'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
