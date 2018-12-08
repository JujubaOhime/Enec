class CreateUserCollegeInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_college_informations do |t|
      t.references :user, foreign_key: true
      t.references :IES, foreign_key: true
      t.string :course
      t.string :period
      t.string :registration_proof

      t.timestamps
    end
  end
end
