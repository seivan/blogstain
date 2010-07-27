Blogstain::Application.routes.draw do
  root :to => "Posts#index"
  
  devise_for :users, :controllers => { :sessions => "sessions" }, 
                      :skip => [:confirmations, :passwords, :unlocks, :registrations]
                      
  match '/logout', :to => 'Sessions#destroy', :as => "logout"
  match '/login', :to => 'Sessions#new', :as => "login"
  
  namespace :admin do |admin|
    root :to => "Dashboard#show"
    resource :dashboard, :controller => "Dashboard"#, :to => "Dashboard#show", :singular => "dashboard"
    
    resources :posts do 
      get(:delete, :on => :member) 
      resources :comments
    end
    
    resources :pages do 
      get(:delete, :on => :member) 
      resources :comments
    end
    
    resources :users do 
      get(:delete, :on => :member) 
      resources :comments
    end
    
    resources :comments do 
      get(:delete, :on => :member) 
      resources :comments
    end
    
  end
  
  resources :posts, :only => [:index, :show] do
    resources :comments
  end
  
  resources :comments, :only => [:create, :update, :edit]
  
  match "posts/:year/:month" => "Posts#index", 
  :constraints => { :year => /\d{4}/, :month => /\w+/},
  :as => :archives
  
  match "posts/tags/:tag" => "Posts#index",
  :constraints => { :tag => /\w+/ },
  :as => :post_tags
                                                    

  match '/blog', :to => "Posts#index"
  match '/journal', :to => "Posts#index"  
  match '/:id', :to => "Pages#show", :as => :page 
  #match "/:year(/:month(/:day))" => "Posts#archive", :constraints => { :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ }
    #root :to => "admin::posts#index"
    #root :to => "admin::dashboard#index"
    #resources :posts
    #resource :dashboard , :singular => "dashboard"
    #resource "admin/posts"

  #match '/signup', :to => 'Users#edit', :as => :signup
  

  #resources :users, :only => [:edit, :update]
  

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

end
