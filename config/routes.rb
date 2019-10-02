Rails.application.routes.draw do
  root 'pages#index'

  get 'catalog/:slug', to: 'sections#show', constraints: lambda { |request| Section.find_by(slug: request.params[:slug]).present? }
  get 'catalog/:id', to: 'products#show', constraints: lambda { |request| Product.find_by(id: request.params[:id]).present? }

  get :catalog, to: redirect('/')

  get :cart, to: 'cart#index'
  post :cart, to: 'cart#create'

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'

  resources :orders, only: %i[index create]

  # Pages
  get :about, to: 'pages#about'
end
