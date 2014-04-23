class RenameImagesColumnInPhotos < ActiveRecord::Migration
  def up
    rename_column :photos, :image, :photo
  end

  def down
    rename_column :photos, :photo, :image
  end
end
