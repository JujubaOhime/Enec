class CreateLots < ActiveRecord::Migration[5.2]
  def change
    create_table :lots do |t|
      t.string :name
      t.integer :status
      t.string :therm
      t.timestamps
    end
  end
end
