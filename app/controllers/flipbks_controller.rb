class FlipbksController < ApplicationController
  
  def index
    @user = User.find(session[:user_id])
  end
  
  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    
    @book = Flipbk.find(params[:id])
    
    if @book.public?
      
    else
      if current_user && @book.user.id == current_user.id
      else
      redirect_to(:root)
      end
    end
  end
  
  def new
    @user = User.find(session[:user_id])
    @book = Flipbk.new
  end

  def create
    @user = User.find(session[:user_id])
    @book = Flipbk.new(params[:flipbk])
    @book.user_id = session[:user_id]
    
    @book.save
    redirect_to(edit_flipbk_path(@book.id))
  end
  
  def edit
    @user = User.find(session[:user_id])
    @book = Flipbk.find(params[:id])
    @photos = Photo.where(params[:flipbk_id])
    # @client = get_dropbox_client
  end

  def update
    @user = User.find(session[:user_id])
    @book = Flipbk.find(params[:id])
    @book.update_attributes(params[:flipbk])
    @book.user_id = session[:user_id]
    
    redirect_to(user_url_path(@user.id))
  end
  
  

  def destroy
    book = Flipbk.find(params[:id])
    
    book.photos.each do |p|
    p.flipbk_id = nil
    end
    
    book.delete
    redirect_to(:users)
  end
  
end
