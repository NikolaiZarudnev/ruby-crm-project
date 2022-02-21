class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :count_product, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
