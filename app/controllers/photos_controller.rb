class PhotosController < ApplicationController
  
  def new
    @user = User.find(session[:user_id])
    @book = Flipbk.where(:flipbk_id => params[:flipbk_id])
    @photo = Photo.new   
  end
  
  def create
    @user = User.find(session[:user_id])
    @photo = Photo.new(:photo => params[:photo])
    
    @photo.flipbk_id = @book.id
    @photo.user_id = session[:user_id] 
    
    @book.update_attributes(:photo_id => @photo.id)
    
    @photo.save
    redirect_to(user_path(@user.id))
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
end



   
