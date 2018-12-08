class AddTermToLot < ActiveRecord::Migration[5.2]
  def change
    change_table :lots do |t|
      t.string :term      
    end
  end
end
