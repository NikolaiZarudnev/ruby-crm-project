FactoryBot.define do
  factory :supplier do
    company { 'MyString' }
    user { create(:user, email: 'Supplier@example.com', is_supplier: true) }
  end
end
