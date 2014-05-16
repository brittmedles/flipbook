class ChangeColumnNamesForUploads < ActiveRecord::Migration
  def up
    rename_column :photos, :photo_url, :image
    rename_column :flipbks, :flipbkk_url, :gif
  end

  def down
    rename_column :photos, :image, :photo_url
    rename_column :flipbks, :gif, :flipbkk_url
  end
end
