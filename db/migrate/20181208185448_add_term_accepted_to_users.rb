class AddTermAcceptedToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.boolean :use_term_accepted, default: 0
      t.boolean :lot_term_accepted, default: 0
    end
  end
end
