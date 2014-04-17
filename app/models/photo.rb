class Photo < ActiveRecord::Base
  attr_accessible :description, :flipbk_id, :photo_url, :user_id, :order
  
  mount_uploader :photo_url, PhotoUrlUploader
  
  belongs_to :flipbk
  belongs_to :user
  
  validates_uniqueness_of :url

  def add_photo
    contents, metadata = client.get_file_and_metadata('/magnum-opus.txt')
    open('magnum-opus.txt', 'w') {|f| f.puts contents }
    
  end







end



