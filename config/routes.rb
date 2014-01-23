Foodlist::Application.routes.draw do
  root to: "welcome#index"
  ActiveAdmin.routes(self)
  break if ARGV.join.include? 'assets:precompile'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", users_controller: "users_controller"}

  scope module: 'authenticated' do
    resources :items do
      get "like", to: "items#like"
      get "dislike", to: "items#dislike"
    end

    concern   :user_comments,  TheComments::UserRoutes.new
    concern   :admin_comments, TheComments::AdminRoutes.new
    resources :comments, concerns:  [:user_comments, :admin_comments]
    resources :comments do
      get "like", to: "comments#like"
      get "dislike", to: "comments#dislike"
    end
  end
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
