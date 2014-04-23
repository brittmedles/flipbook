class Photo < ActiveRecord::Base
  attr_accessible :description, :flipbk_id, :photo, :user_id, :order
  
  mount_uploader :photo, PhotoUploader
  
  belongs_to :flipbk
  belongs_to :user
  
  validates_uniqueness_of :image

end



