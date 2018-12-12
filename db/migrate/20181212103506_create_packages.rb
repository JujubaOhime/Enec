class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.references :lot, foreign_key: true
      t.string :name
      t.float :value
      t.text :description

      t.timestamps
    end
  end
end
