class AddLinkToAirfares < ActiveRecord::Migration[5.2]
  def change
    change_table :airfares do |t|
      t.string :link
    end
  end
end
