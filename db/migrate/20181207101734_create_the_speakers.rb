class CreateTheSpeakers < ActiveRecord::Migration[5.2]
  def change
    create_table :the_speakers do |t|
      t.string :title
      t.text :description
      t.string :image
      t.timestamps
    end
  end
end
