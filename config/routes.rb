Rails.application.routes.draw do
  	resources :uploads
        
root :to => 'uploads#index'

get "/content" => "uploads#content"

get "/info" => "uploads#info"

get "/person" => "uploads#person"

get "/person_edit" => "uploads#person_edit"

post  "/edit_user" => "uploads#edit_user"

post  "/delete_user" => "uploads#delete_user"

get  "/delete_user" => "uploads#delete_user"

match "/admin_login" => "uploads#admin_login", via: [:get, :post]

match "/user_login" => "uploads#user_login", via: [:get, :post]

match "/admin_view" => "uploads#admin_view", via: [:get, :post,:patch]

post "/user_view" => "uploads#user_view"

get "/user_view" => "uploads#user_view"

get "/user_logout" => "uploads#user_logout"

get "/admin_logout" => "uploads#admin_logout"

match "/sendmail" => "uploads#sendmail", via: [:get, :post]

match "/register" => "uploads#register", via: [:get, :post]


get "/password_new" => "uploads#password_new"


get "/forgot_password" => "uploads#forgot_password"

post "/passmail" => "uploads#passmail"

get "/passmail" => "uploads#passmail"










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
  #       get 'short'associations
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   endassociations
    
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
