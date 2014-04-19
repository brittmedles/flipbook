class Flipbk < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :speed, :public, :gif, :display, :order
  
  mount_uploader :gif, GifUploader
                 
  belongs_to :user
  has_many :photos
  
  # def save_to_s3(dir, name)
#     service = S3::Service.new(
#       :access_key_id     => ENV['AWS_ACCESS_KEY_ID'], 
#       :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
#     )
#     
#     speed = self.speed / 10
#     system("convert -delay #{speed} #{dir}*.png #{dir}#{name}.gif")
#     
#     # dir/flipbook.gif to amazon s3 and then save public url to flipbk
#     
#     bucket = service.buckets.find("flipbookv2")
# 
#     new_object = bucket.objects.build("#{name}.gif")
# 
#     new_object.content = open("#{dir}#{name}.gif")
# 
#     new_object.save
#     
#     object = bucket.objects.find("#{name}.gif")
#     @book.url = object.url
# 
#     @book.save  
#   end

end
