class FlipbksController < ApplicationController
  
  def index
    @user = User.find(session[:user_id])
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
    
    # if @book.save
#       dir = "#{RAILS_ROOT}/tmp/#{@book.id}/"
#       name = "#{@book.user_id}-#{@book.id}-#{@book.name.gsub(/\s+/, "")}"
#       orders = []
#       
#       @book.photos.each_with_index do |photo, index| 
#         Dir.mkdir(dir) unless File.exists?(dir)
#         open("#{dir}image#{photo.order}#{photo.id}.png", 'wb') do |file|
#         file << open(photo.url).read
#         end
#       end
#       
#       @book.save_to_s3(dir, name)
# 
#       redirect_to(flipbk_path(@book.id))
#     else
#       render "new"
#     end
  end
  
  def edit
    @book = Flipbk.find(params[:id])
  end

  def update
    @book = Flipbk.find(params[:id])
    @book.update_attributes(params[:flipbk])
    @book.user_id = session[:user_id]
    
    # if @book.save
#       dir = "#{RAILS_ROOT}/tmp/#{@book.id}/"
#       name = "#{@book.user_id}-#{@book.id}-#{@book.name.gsub(/\s+/, "")}"
#       
#       Photo.all.each do |p|
#         if p.flipbk_id == @book.id
#         p.flipbk_id = nil
#         p.save
#         end  
#       end
#       
#       @book.save_to_s3(dir, name)
#       
#       FileUtils.remove_dir(dir,true)
#       
#       redirect_to(flipbk_path(@book.id))
#     else
#       render "edit"
#     end
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

  def destroy
    book = Flipbk.find(params[:id])
    
    book.photos.each do |p|
    p.flipbk_id = nil
    end
    
    book.delete
    redirect_to(:users)
  end
  
end
