class UsersController < ApplicationController
  
  def index
    if current_user
      redirect_to(user_url(current_user.id))
    end
  end
  
  def new
     @user = User.new
  end

  def create
   @user = User.new(params[:user])

   if @user.save
     session[:user_id] = @user.id
  
     redirect_to(user_url(current_user.id))
   else
     render "new"
   end
  end
  
  def show
    @user = User.find(session[:user_id])
    
    if params[:id].to_s == session[:user_id].to_s
    else
      redirect_to profile_url params[:id].to_i
    end 
  end
  
  def edit
    @user = User.find(session[:user_id])
  end

  def update
    redirect_to(user_url(current_user.id))
  end
  
  def destroy
    redirect_to(:root)
  end

end
