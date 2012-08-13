Lsm::Application.routes.draw do
  
  get "admin" => 'admin#index'

  match 'register' => 'users#new'
  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'
  match 'search' => 'home#search'
  match 'settings' => 'users#edit'
  resources :sessions
  resources :surveys do 
    resources :questions do 
      resources :choices do
        resources :answers
      end
      resources :answers
    end
  end
  resources :studies
  resources :users
  resources :projects do 
    resources :memberships do 
      member do
        get 'edit' => 'memberships#edit', :as => 'edit'
        get ':state' => 'memberships#edit', :as => 'change'
      end
    end
    resources :assumptions do 
      member do
        get 'edit' => 'assumptions#edit', :as => 'edit'
        get ':state' => 'assumptions#edit', :as => 'change'
      end
    end
    resources :scorecards do 
      member do
        get 'edit' => 'scorecards#edit', :as => 'edit'
        get ':state' => 'scorecards#edit', :as => 'change'
      end
    end
    resources :experiments do 
      member do
        get 'edit' => 'assumptions#edit', :as => 'edit'
        get ':state' => 'assumptions#edit', :as => 'change'
      end
    end
    resources :hypotheses do 
      member do
        get 'edit' => 'hypotheses#edit', :as => 'edit'
        get ':state' => 'hypotheses#edit', :as => 'change'
      end
    end
    resources :studies
    resources :documents
    resources :tasks
    resources :customer_hypotheses
    resources :problem_hypotheses
    resources :solution_hypotheses
  end
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
