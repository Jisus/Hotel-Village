Hotel::Application.routes.draw do
  
  root :to => 'pages#index'

  match '/reservas/confirma/:id' => 'reservas#confirma', :as => :confirma_reserva
  match 'admin/' => 'admin/dashboard#index', :as => :admin_home
  match '/reservas/show/:dataEntrada/:dataSaida' => 'reservas#show'
  match '/reservas/create' => 'reservas#create', :as => :create_reserva
  match '/reservas/nova/:id/:dataEntrada/:dataSaida' => 'reservas#nova', :as => :nova_reserva
  match '/clientes/sucesso' => 'clientes#sucesso', :as => :cliente_sucesso

  resources :quartos

  namespace :admin do
    resources :produtos
    resources :checkouts do
      member do
        get :imprimir
      end
    end
    resources :clientes
    resources :usuarios
    resources :flags
    resources :quartos
    resources :tipos_quartos
    resources :reservas do 
      member do
        get :checkout
        post :checkout_save
      end
    end
    
  end
  
  devise_for :usuarios, :skip => [:sessions], :controllers => { :sessions => "admin/sessions"}
  
  as :usuario do
    get 'admin/login' => 'admin/sessions#new', :as => :new_usuario_session
    post 'admin/login' => 'admin/sessions#create', :as => :usuario_session
    get 'admin/logout' => 'admin/sessions#destroy', :as => :destroy_usuario_session,
    :via => Devise.mappings[:usuario].sign_out_via
  end

  devise_for :clientes, :controllers => { :sessions => "sessions", :registrations => :registrations}
  
  as :cliente do
    get 'clientes/login' => 'sessions#new', :as => :new_cliente_session
    post 'clientes/login' => 'sessions#create', :as => :cliente_session
    get 'clientes/logout' => 'sessions#destroy', :as => :destroy_cliente_session,
    :via => Devise.mappings[:cliente].sign_out_via
  end
  
  match ':controller(/:action(/:id))(.:format)'
  
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  
end
