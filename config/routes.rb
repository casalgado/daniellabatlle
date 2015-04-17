Rails.application.routes.draw do


  resource :pages do
    get 'home'
    get 'intro'
    get 'collections'
    get 'about'
    get 'stores'
  end

  # namespace :spree do
  #   resource :mercado_pago, only: [] do
  #     get 'pending'
  #     get 'callback'
  #     get 'failure'
  #   end
  # end

  mount Spree::Core::Engine, :at => '/'
  Spree::Core::Engine.routes.draw do
    resource :mercado_pago, only: [], controller: 'mercado_pago' do
      get 'pending'
      get 'callback'
      get 'failure'
    end

    get "/wholesaler/states" => "spree/wholesaler_states#index"

    resources :wholesalers

    namespace(:admin) do

      resources :wholesalers do
        member do
          get :approve
          get :reject
        end
      end

    end
  end

end
