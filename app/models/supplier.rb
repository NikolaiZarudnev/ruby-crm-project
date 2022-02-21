class Supplier < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :user
  validates :company, presence: true
end
