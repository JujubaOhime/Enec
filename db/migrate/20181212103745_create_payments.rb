class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :package, foreign_key: true
      t.integer :payment_option
      t.integer :parceling_option
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
