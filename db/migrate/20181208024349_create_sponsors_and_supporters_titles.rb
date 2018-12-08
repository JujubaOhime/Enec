class CreateSponsorsAndSupportersTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsors_and_supporters_titles do |t|
      t.string :title

      t.timestamps
    end
  end
end
