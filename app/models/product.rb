class Product < ApplicationRecord
  belongs_to :supplier
  has_many :orders, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_float: true, greater_than: 0 }
end
