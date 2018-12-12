class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.float :value

      t.timestamps
    end
  end
end
