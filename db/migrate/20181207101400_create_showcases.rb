class CreateShowcases < ActiveRecord::Migration[5.2]
  def change
    create_table :showcases do |t|
      t.string :title
      t.string :subtitle
      t.string :phrase
      t.string :image

      t.timestamps
    end
  end
end
