class Tag < ApplicationRecord

  has_many :shop_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :shops,     through: :shop_tags

  validates :name, presence: true
end