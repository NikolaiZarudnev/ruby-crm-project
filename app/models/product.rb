class Product < ApplicationRecord
  belongs_to :supplier
  has_many :orders, dependent: :destroy
end
