class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email 
      t.string :delegation
      t.string :name
      t.string :telephone
      t.string :cpf
      t.string :rg
      t.string :rg_issuing_body
      t.datetime :birth_date
      t.integer :gender
      t.string :address
      t.string :city
      t.string :state
      t.string :password_digest
      t.string :image
      t.boolean :admin , default: false
      t.string :course
      t.string :period
      t.string :registration_proof

      t.boolean :subscribe_status , default: false
      t.boolean :therm_acepted, default: false

      t.references :IES , foreign_key: true
      t.references :lot, foreign_key: true
      t.references :package, foreign_key: true
      t.references :payment, foreign_key: true

      t.timestamps
    end
  end
end
