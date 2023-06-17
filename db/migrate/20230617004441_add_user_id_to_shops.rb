class AddUserIdToShops < ActiveRecord::Migration[6.1]
  def change
    add_reference :shops, :user, foreign_key: true
  end
end
