class CreateTheEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :the_events do |t|
      t.string :title
      t.string :days
      t.text :content

      t.timestamps
    end
  end
end
