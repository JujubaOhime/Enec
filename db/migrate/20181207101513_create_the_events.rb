class CreateTheEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :the_events do |t|
      t.string :title
      t.string :days
      t.string :mounth
      t.string :locality
      t.text :content
      


      t.timestamps
    end
  end
end
