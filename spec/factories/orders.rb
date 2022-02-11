FactoryBot.define do
  factory :order do
    user { nil }
    product { nil }
    count_product { 1 }
  end
end
