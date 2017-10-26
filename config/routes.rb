Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
     resources :songs, only: [:index, :update]
     post('/search', {to: 'songs#search'})
   end
 end
end
