class AddValueToPayments < ActiveRecord::Migration[5.2]
  def change
    change_table :payments do |t|
      t.decimal :value
    end
  end
end
