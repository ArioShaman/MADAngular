Rails.application.routes.draw do
  root to: 'country_play_list#index'
  resources :country_play_list, only: [:index, :show] do
    #post 'import_csv', to: 'country_play_list#import'
    collection do
      post :import
    end
  end
end
