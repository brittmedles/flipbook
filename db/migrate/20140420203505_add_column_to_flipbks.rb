class AddColumnToFlipbks < ActiveRecord::Migration
  def change
    add_column :flipbks, :photo_id, :integer
  end
end
