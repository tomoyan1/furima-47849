class Address < ApplicationRecord
  # 通常のアソシエーション
  belongs_to :order
  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
