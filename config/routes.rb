Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
     resources :songs, only: [:index, :update]
     post('/search', {to: 'songs#search_post'})
     get('/search', {to: 'songs#search_get'})
   end
 end
end
