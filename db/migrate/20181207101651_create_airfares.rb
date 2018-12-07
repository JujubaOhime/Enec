class CreateAirfares < ActiveRecord::Migration[5.2]
  def change
    create_table :airfares do |t|
      t.string :title
      t.string :phrase

      t.timestamps
    end
  end
end
