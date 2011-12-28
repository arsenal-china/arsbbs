Arsbbs::Application.routes.draw do
  
  root :to => 'alpha#index'

  match 'home'          => 'home#index',        :as => :home
  match '/'             => 'alpha#index',       :as => :alpha
  match 'signup'        => 'users#new',         :as => :signup
  match 'profile/edit'  => 'users#edit',        :as => :edit_profile
  match 'proc_login'    => 'sessions#create',   :as => :proc_login
  match 'logout'        => 'sessions#destroy',  :as => :logout

  resources :users
  resources :boards

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
