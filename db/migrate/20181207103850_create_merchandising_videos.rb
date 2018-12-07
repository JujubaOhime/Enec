class CreateMerchandisingVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :merchandising_videos do |t|
      t.string :title
      t.string :video

      t.timestamps
    end
  end
end
