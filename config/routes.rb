Rails.application.routes.draw do
  root to: 'country_play_list#index'
  resources :country_play_list, only: [:index, :show]
  resources :import_csvs do
    collection do
      post :import
    end
  end
end
