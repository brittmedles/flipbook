require 'dropbox_sdk'

class PhotosController < ApplicationController
  
  # Starts authorization check to add a new photo from Dropbox.
  def new
      @photo = Photo.new
      @book = Flipbk.where(:flipbk_id => params[:flipbk_id]) 
  end
  
  # Download a file from Dropbox
  def create
    client = get_dropbox_client
    unless client
        redirect_to(:action => 'auth_start') and return
    end
    account_info = client.account_info
    
    begin
      # resp = client.put_file(params[:file].original_filename, params[:file].read)
          
      # contents, metadata = client.get_file_and_metadata('/magnum-opus.txt')
      # open('magnum-opus.txt', 'w') {|f| f.puts contents }
    
      @photo = client.get_file(params[:photo], params[:photo].write)
      @book = Flipbk.find(params[:flipbk_id])
        
      rescue DropboxAuthError => e
        session.delete(:access_token)
        logger.info "Dropbox auth error: #{e}"
        render :text => "Dropbox auth error"
      rescue DropboxError => e
        logger.info "Dropbox API error: #{e}"
        render :text => "Dropbox API error"
    end
    
    if @photo.save
      @photo.update_attributes(:flipbk_id => @book.id)
      @book.update_attributes(:photo_id => @photo.id)
      redirect_to(edit_flipbk_path(@book.id))
    else
      render "new"
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  
  
end




   
