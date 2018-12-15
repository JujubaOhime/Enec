class FixEnglish < ActiveRecord::Migration[5.2]
  def change
    rename_column :lots, :therm, :term
    rename_column :the_events, :mounth, :month
    rename_column :users, :therm_acepted, :term_accepted
  end
end
