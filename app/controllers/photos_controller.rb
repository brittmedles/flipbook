class PhotosController < ApplicationController

#   Old Instagram code:  
#   def connect
#     redirect_to(Instagram.authorize_url(:redirect_uri => ENV["INSTAGRAM_CALLBACK_URL"]))
#   end
#   
#   def callback
#     response = Instagram.get_access_token(params[:code], :redirect_uri => ENV["INSTAGRAM_CALLBACK_URL"])
#     session[:access_token] = response.access_token
# 
#     @client = Instagram.client(:access_token => session[:access_token])
#    
#     for media_item in @client.user_recent_media
#       photo_url = media_item.images.standard_resolution.url
#       photo = Photo.create(:url => photo_url , :user_id => session[:user_id]) 
#     end
#     
#     redirect_to(:new_flipbk)
#   end
  
end
