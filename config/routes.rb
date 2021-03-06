Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  root 'main#index'
  get 'main/faq'

  resources :posts do
    member do
      post 'edit'
    end
    resources :comments, only: [:create, :destroy], shallow: true
  end

  resources :register, only: [:new, :create] do
    collection do
      get 'result'
    end
  end
  devise_for :users,  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :announces
  resources :posts
  get 'posts/get_pass/:id' => 'posts#get_pass',  as: 'posts_pass'

  get 'register/result'
  get 'teamlist/index'

  get 'teamlist/new'
  get 'teamlist/sendtest'
  get 'teamlist/selectmessage'
  get 'teamlist/selectsender'
  get 'teamlist/table'
  post 'teamlist/create'
  post 'teamlist/sendmessage'

  scope module: 'teamlist' do
    resources :messages
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
