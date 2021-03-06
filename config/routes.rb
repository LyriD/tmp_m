Rails.application.routes.draw do

  cms_fortress_routes :path => '/cms-admin'

  comfy_route :cms_admin, :path => '/cms-admin'

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => true

  namespace :admin do
    resources :services
    resources :feedbacks
    resources :feed_back_forms
    resources :feed_back_form_fields
    resources :template_mails do
      get 'offerings', defaults: { format: 'json' }
      post 'send_mail', on: :member
    end
    resources :teams do
      post :update_row_order, on: :collection
    end
  end

  comfy_route :blog_admin, :path => '/admin'
  comfy_route :blog, :path => '/articles'
  comfy_route :cms_admin, :path => '/admin'


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
