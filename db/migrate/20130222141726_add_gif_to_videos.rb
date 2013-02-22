class AddGifToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :gif, :string
  end
end
