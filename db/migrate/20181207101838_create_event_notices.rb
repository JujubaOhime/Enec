class CreateEventNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :event_notices do |t|
      t.string :title
      t.text :content
      t.string :image
      t.string :document
      t.timestamps
    end
  end
end
