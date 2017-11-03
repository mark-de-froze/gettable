Rails.application.routes.draw do
  resources :visitors

  resources :restaurants do
    resources :tables do
      resources :reservations
    end
  end

  root to: 'welcome#index'
end
