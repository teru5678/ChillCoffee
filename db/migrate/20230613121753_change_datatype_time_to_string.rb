class ChangeDatatypeTimeToString < ActiveRecord::Migration[6.1]
  def change
    change_column :shops, :closed, :string
    change_column :shops, :opneing, :string
  end
end
