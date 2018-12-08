class CreateEventRealizersTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :event_realizers_titles do |t|
      t.string :title

      t.timestamps
    end
  end
end
