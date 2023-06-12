class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true #会員ID
      t.references :shop, null: false, foreign_key: true #店舗ID
      t.string :comment, null: false #コメント
      t.timestamps
    end
  end
end
