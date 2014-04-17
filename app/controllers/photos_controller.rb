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
  def new
      client = get_dropbox_client
      unless client
          redirect_to(:action => 'auth_start') and return
      end

      account_info = client.account_info
  end
  
  
  
  
end
