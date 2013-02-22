class CreateVideo < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.string :url, null: false
      t.string :video_filename

      t.timestamps
    end
  end

  def down
    drop_table :videos
  end
end
