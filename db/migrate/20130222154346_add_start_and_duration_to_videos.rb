class AddStartAndDurationToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :start, :integer
    add_column :videos, :duration, :integer
  end
end
