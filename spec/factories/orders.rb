FactoryBot.define do
  factory :order do
    user { create(:user) }
    product { create(:product) }
    count_product { 1 }
  end
end
