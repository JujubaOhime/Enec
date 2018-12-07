class CreateSponsorsAndSupporters < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsors_and_supporters do |t|
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
