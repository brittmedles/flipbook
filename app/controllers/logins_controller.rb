class LoginsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_url(@user.id)
    else
      render "new"
    end
  end
  
  def destroy
    authorize
    session[:user_id] = nil
    redirect_to(:root)
  end
  
end