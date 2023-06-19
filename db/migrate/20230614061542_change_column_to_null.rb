class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :shops, :latitude, true
    change_column_null :shops, :longitude, true
  end
end
