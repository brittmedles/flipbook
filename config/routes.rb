Flipbook::Application.routes.draw do

   resources :users, :flipbks, :logins, :photos
   
   get "dropbox/client_chk" => 'dropbox#client_chk', :as => :dbcheck
   get "dropbox/auth_start" => 'dropbox#auth_start', :as => :dbstart
   get "dropbox/auth_finish" => 'dropbox#auth_finish', :as => :dbfinish
   
   get 'profile/:id' => 'public#profile', :as => :profile
   
   get 'flipbks/delete/:id' => 'flipbks#destroy'
   match 'users/:id' => 'users#show'
   
   # To visualize grid structure.
   get '/grid/' => 'public#grid'
   
   root :to => 'public#index'

end


       