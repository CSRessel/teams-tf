Rails.application.routes.draw do

  # static pages
  root 'static#index'
  get 'about',    to: 'static#about'
  get 'contact',  to: 'static#contact'
  get 'denied',   to: 'static#denied'
  get 'goodbye',  to: 'static#goodbye'
  get 'lfp',      to: 'static#lfp'
  get 'lft',      to: 'static#lft'
  # TODO: delete this when back online
  get 'login',    to: 'static#tmp_login', as: 'login'

  # authentication
  get 'auth/steam', as: 'sign_in'
  post 'auth/steam/callback' => 'auth#auth_callback'
  get 'sign_out' => 'auth#sign_out', as: 'sign_out'

  # user paths
  resources :users

  # review paths
  resources :reviews
  #match 'players/:id/review', to: 'reviews#new',      via: [:get],          as: 'new_review'
  #match 'reviews',            to: 'reviews#create',   via: [:post],         as: 'review'
  #match 'reviews/:id',        to: 'reviews#update',   via: [:put, :patch]
  #match 'reviews/:id',        to: 'reviews#destroy',  via: [:delete]
  #match 'reviews/:id/edit',   to: 'reviews#edit',     via: [:get],          as: 'edit_review'

  # player paths
  resources :players
  # for ransack's search path
  resources :players do
    collection do
      match 'search' => 'players#search', via: [:get, :post], as: :search
    end
  end

  # team paths
  resources :teams
  # for ransack's search path
  resources :teams do
    collection do
      match 'search' => 'teams#search', via: [:get, :post], as: :search
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
