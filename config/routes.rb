Rails.application.routes.draw do
  root "cards#index"

  resources :cards, :except => [:new, :show]

  get '*path', to: 'cards#index'
end
