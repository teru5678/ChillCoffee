class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false #店舗名
      t.string :address, null: false #住所
      t.time :opneing, null: false #営業開始時間
      t.time :closed, null: false #営業終了時間
      t.string :phone, null: false #電話番号
      t.float :latitude, null: false #緯度
      t.float :longitude, null: false #経度
      t.timestamps
    end
  end
end
