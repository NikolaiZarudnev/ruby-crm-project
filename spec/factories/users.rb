FactoryBot.define do
  factory :user do
    email { 'Client@example.com' }
    name { 'MyString' }
    password { 'MyString' }
    phone_number { '12345678' }
    is_admin { nil }
    is_supplier { nil }
    is_operator { nil }
    is_customer { nil }
  end
end
