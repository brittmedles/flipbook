class ChangeColumnNames < ActiveRecord::Migration
  def up
    rename_column :photos, :url, :photo_url
    rename_column :flipbks, :url, :flipbkk_url
  end

  def down
    rename_column :photos, :photo_url, :url
    rename_column :flipbks, :flipbkk_url, :url
  end
end
