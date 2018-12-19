class Parcels < ActiveRecord::Migration[5.2]
  def change
    create_table :parcels do |t|
      t.references :payment, foreign_key: true
      t.decimal :value
      t.integer :status

      t.timestamps
    end
  end
end
