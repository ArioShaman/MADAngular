Rails.application.routes.draw do
  root to: 'country_play_list#index'
  resources :countries
  resources :country_play_list
end
