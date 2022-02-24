FactoryBot.define do
  factory :product do
    title { 'MyString' }
    description { 'MyString' }
    price { 1.5 }
    image { Rails.root.join('app', 'assets', 'images', 'none.jpg') }
    hidden { false }
    supplier { create(:supplier) }
  end
end
