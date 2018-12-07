class CreateEventRealizers < ActiveRecord::Migration[5.2]
  def change
    create_table :event_realizers do |t|
      t.string :image
      t.string :name
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
