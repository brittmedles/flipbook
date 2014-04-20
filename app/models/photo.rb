class Photo < ActiveRecord::Base
  attr_accessible :description, :flipbk_id, :image, :user_id, :order
  
  mount_uploader :image, ImageUploader
  
  belongs_to :flipbk
  belongs_to :user
  
  validates_uniqueness_of :image
  
  # after_save :enqueue_image
  
  def image_name
    File.basename(image.path || image.filename) if image
  end

  # def enqueue_image
#     ImageWorker.perform_async(id, key) if key.present?
#   end
# 
#   class ImageWorker
#     include Sidekiq::Worker
#   
#     def perform(id, key)
#       photo = Photo.find(id)
#       photo.key = key
#       photo.remote_image_url = photo.image.direct_fog_url(with_path: true)
#       photo.save!
#       photo.update_column(:image_processed, true)
#     end
#   end

end



