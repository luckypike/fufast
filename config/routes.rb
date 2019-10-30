Rails.application.routes.draw do
  root 'pages#index'

  get 'catalog/:slug', to: 'sections#show', constraints: lambda { |request| Section.find_by(slug: request.params[:slug]).present? }, as: :section_catalog
  get 'catalog/:id', to: 'products#show', constraints: lambda { |request| Product.find_by(id: request.params[:id]).present? }, as: :product_catalog

  get :catalog, to: redirect('/')

  get :cart, to: 'cart#index'
  post :cart, to: 'cart#create'

  namespace :cart do
    delete ':id', action: :destroy, as: :destroy
  end

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'

  get :recovery, to: 'sessions#password'
  post :recovery, to: 'sessions#recovery'

  get :reset, to: 'sessions#rereset'
  post :reset, to: 'sessions#reset'

  resources :orders, only: %i[create show]
  resources :users, only: %i[show]

  # Pages
  get :about, to: 'pages#about'
  get :contacts, to: 'pages#contacts'
  get :logo, to: 'pages#logo'

  # Search
  get :search, to: 'search#index'
end
