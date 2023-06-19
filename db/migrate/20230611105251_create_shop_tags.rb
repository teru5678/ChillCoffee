class CreateShopTags < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_tags do |t|
      #中間テーブル
       t.references :tag, null: false, foreign_key: true #タグID
      t.references :shop, null: false, foreign_key: true #店舗ID
      t.timestamps
    end
  end
end
