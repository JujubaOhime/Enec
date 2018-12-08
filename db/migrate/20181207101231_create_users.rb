class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :delegation
      t.references :lot, foreign_key: true
      t.string :name
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
      t.timestamps
    end
  end
end
