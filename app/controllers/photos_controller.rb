require 'dropbox_sdk'

class PhotosController < ApplicationController

  # Methods for authorizing use of Dropbox data.
  def get_dropbox_client
      if session[:access_token]
          begin
              access_token = session[:access_token]
              DropboxClient.new(access_token)
          end
      end
  end

  def get_web_auth()
      redirect_uri = url_for(:action => 'auth_finish')
      DropboxOAuth2Flow.new(ENV["DROPBOX_APP_KEY"], ENV["DROPBOX_APP_SECRET"], redirect_uri, session, :dropbox_auth_csrf_token)
  end

  def auth_start
      authorize_url = get_web_auth().start()

      # Send the user to the Dropbox website so they can authorize app. After the user
      # authorizes app, Dropbox will redirect them here with a 'code' parameter.
      redirect_to authorize_url
  end

  def auth_finish
      begin
          access_token, user_id, url_state = get_web_auth.finish(params)
          session[:access_token] = access_token
          redirect_to(:new_flipbk)
      end
  end
  
  # Starts authorization check to add a new photo from Dropbox.
  # def new
  #     client = get_dropbox_client
  #     unless client
  #         redirect_to(:action => 'auth_start') and return
  #     end
  #     account_info = client.account_info
  #     
  #     @photo = Photo.new(key: params(:key))  
  # end
  # 
  # 
  # def create
  #     client = get_dropbox_client
  #     unless client
  #         redirect_to(:action => 'auth_start') and return
  #     end
  # 
  #     begin
  #         @book = Flipbk.find(params[:id])
  #         
  #         # Download a file from Dropbox
  #         @uploader = client.get_file_and_metadata(params[:image])
  #         photo = Photo.create(:image => @uploader, :user_id => session[:user_id])
  #         
  #         @uploader.success_action_redirect = edit_flipbk_path(@book.id)
  #         
  #     rescue DropboxAuthError => e
  #         session.delete(:access_token)  # An auth error means the access token is probably bad
  #         logger.info "Dropbox auth error: #{e}"
  #         render :text => "Dropbox auth error"
  #     rescue DropboxError => e
  #         logger.info "Dropbox API error: #{e}"
  #         render :text => "Dropbox API error"
  #     end
  # end
    
    def index
       @photos = Photo.all
       @uploader = Photo.new.image
       @uploader.success_action_redirect = new_photo_url
     end

     def show
       @photo = Photo.find(params[:id])
     end

     def new
       @photo = Photo.new(key: params[:key])
     end

     def create
       @photo = Photo.new(params[:id])
       if @photo.save
         redirect_to photos_url, notice: "Painting was successfully created."
       else
         render :new
       end
     end

     def edit
       @photo = Photo.find(params[:id])
     end

     def update
       @photo = Photo.find(params[:id])
       if @photo.update_attributes(params[:painting])
         redirect_to photos_url, notice: "Painting was successfully updated."
       else
         render :edit
       end
     end

     def destroy
       @photo = Photo.find(params[:id])
       @photo.destroy
       redirect_to photos_url, notice: "Painting was successfully destroyed."
     end

  
  
  
  
end




   
