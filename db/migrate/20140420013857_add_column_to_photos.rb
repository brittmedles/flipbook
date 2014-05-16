class AddColumnToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :name, :string
  end
end
