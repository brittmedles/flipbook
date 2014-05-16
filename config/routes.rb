Flipbook::Application.routes.draw do

   resources :users, :flipbks, :logins, :photos
   
   get 'profile/:id' => 'public#profile', :as => :profile
   
   get 'flipbks/delete/:id' => 'flipbks#destroy'
   match 'users/:id' => 'users#show'
   
   # To visualize grid structure.
   get '/grid/' => 'public#grid'
   
   root :to => 'public#index'

end


       