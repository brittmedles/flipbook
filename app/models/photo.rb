class Photo < ActiveRecord::Base
  attr_accessible :description, :flipbk_id, :image, :user_id, :order
  
  mount_uploader :image, ImageUploader
  
  belongs_to :flipbk
  belongs_to :user
  
  validates_uniqueness_of :image

end



