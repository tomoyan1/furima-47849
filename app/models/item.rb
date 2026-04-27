class Item < ApplicationRecord
  # 通常のアソシエーション
  belongs_to :user
  has_one :order
  has_one_attached :image

  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :shipping_day
  belongs_to :shipping_cost

  with_options presence: true do
    validates :image
    validates :name
    validates :description

    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :shipping_day_id
      validates :prefecture_id
    end
  end
end
