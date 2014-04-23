class RemoveGifFromFlipbks < ActiveRecord::Migration
  def up
    remove_column :flipbks, :gif
  end

  def down
    add_column :flipbks, :gif, :string
  end
end
