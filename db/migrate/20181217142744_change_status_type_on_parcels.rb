class ChangeStatusTypeOnParcels < ActiveRecord::Migration[5.2]
  def change
    change_column :parcels, :status, :integer
  end
end
