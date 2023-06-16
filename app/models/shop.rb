class Shop < ApplicationRecord
    has_many :comments,  dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :shop_tags, dependent: :destroy
    has_many :tags,      through: :shop_tags
    has_one_attached :image
    #addressを登録した際に緯度、経度のカラムに自動的に値を入れてくれるようになる
    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    def save_tags(tags)
        #タグをスペース区切りで分割し配列にする
        tag_list = tags.split(/[[:blank:]]+/)
        #店舗に関連づいたタグを取得する
        current_tags = self.tags.pluck(:name)
        old_tags = current_tags - tag_list
        new_tags = tag_list - current_tags
        p current_tags

        old_tags.each do |old|
          self.tags.delete Tag.find_by(name: old)
        end

        new_tags.each do |new|
            new_shop_tag = Tag.find_or_create_by(name: new)
            self.tags << new_shop_tag
        end
    end

    def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
    end
end
