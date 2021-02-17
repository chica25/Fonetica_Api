Rails.application.routes.draw do
  resources :languages, only: [:index] do
    resources :phrases, only: [:index]
  end
  #   resources :phrases
end
