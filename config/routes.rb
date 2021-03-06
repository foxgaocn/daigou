Daigou::Application.routes.draw do

  devise_for :users
  resources :products

  #root 'home#index'
  root 'products#index'

  #get 'my', to: 'users#dash_board', as: :user_root 
  get 'my', to: 'users#orders', as: :user_root 
  
  get '/my/orders', to: 'users#orders'
  get '/my/addresses', to: 'users#addresses'
  get '/my/products', to: 'users#products'
  put 'my/update_products', to: 'users#update_products'

  resources :carts, only: [:show, :update] do
    post 'add_item', on: :collection
    get 'item_quantity', on: :collection
    post 'clear', on: :collection
  end

  resources :stores, only: [:edit, :update]

  resources :orders, only: [:new, :show] do
    post :confirm, on: :member
    get :confirmed, on: :member
    get :detail, on: :member
    resources :packages, only: [] do
      post :batch_update, on: :collection
    end
  end

  resources :addresses, only: [:create, :index, :show]

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
  #     resources :comments
  #     resources :sales do
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
