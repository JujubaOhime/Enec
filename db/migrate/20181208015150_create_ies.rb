class CreateIes < ActiveRecord::Migration[5.2]
  def change
    create_table :ies do |t|
      t.string :name
      t.string :city

      t.timestamps
    end
  end
end
