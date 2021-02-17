Rails.application.routes.draw do
  resources :languages, only: [:index] do
    resources :phrases, only: [:index, :create]
  end
  #   resources :phrases
end
