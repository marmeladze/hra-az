Rails.application.routes.draw do

  root 'home#index'

  get '/admin' => 'admin/pages#index'
  get '/contacts' => 'home#contacts'

  resources :pages, only: [:index, :show], param: :slug, path: "sehifeler"
  resources :categories, only: [:index, :show], param: :slug, path: "bolmeler"
  resources :articles, only: [:show], param: :slug, path: "yazilar"
  resources :authors, only: [:index, :show], param: :slug, path: "muellifler"
  resources :documents, only: [:index, :show], param: :slug, path: "senedler"
  resources :questions, only: [:index, :show], param: :slug, path: "sual-cavab"
  resources :publications, only: [:index, :show], param: :slug, path: 'nesrler'

  get 'categories', to: redirect('/bolmeler')
  get 'categories/:slug', to: redirect('/bolmeler/%{slug}')
  get 'pages', to: redirect('/sehifeler')
  get 'pages/:slug', to: redirect('/sehifeler/%{slug}')
  get 'articles/:slug', to: redirect('/yazilar/%{slug}')
  get 'authors', to: redirect('/muellifler')
  get 'authors/:slug', to: redirect('/muellifler/%{slug}')
  get 'documents', to: redirect('/senedler')
  get 'documents/:slug', to: redirect('/senedler/%{slug}')
  get 'questions', to: redirect('/sual-cavab')
  get 'questions/:slug', to: redirect('/sual-cavab/%{slug}')
  get 'publications', to: redirect('/nesrler')
  get 'publications/:slug', to: redirect('/nesrler/%{slug}')

  namespace :admin do
    resources :questions

    resources :pages do 
      put "remove", on: :member
    end
    resources :articles do 
      put "remove", on: :member
    end
    resources :categories do 
      put "remove", on: :member
    end
    resources :authors do 
      put "remove", on: :member
    end
    resources :documents do 
      put "remove", on: :member
    end
    resources :contacts
    resources :publications, except: [:show, :destroy]
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
