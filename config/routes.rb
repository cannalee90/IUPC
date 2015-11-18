Rails.application.routes.draw do
  get 'teamlist/index'
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  
  devise_for :users
  resources :announces
  resources :posts
  get 'posts/get_pass/:id' => 'posts#get_pass',  as: 'posts_pass'

  get 'problem/A'
  get 'problem/B'
  get 'problem/C'
  get 'problem/D'
  
  get 'register/new'
  post 'register/create'
  get 'register/result'
  
  get 'teamlist/new'
  post 'teamlist/create'
  get 'teamlist/sendtest'
  get 'teamlist/selectmessage'
  get 'teamlist/selectsender'
  post 'teamlist/sendmessage'
  
  root 'main#index'
  get 'faq/main'
  
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
