FactoryBot.define do
  factory :user do
    email { 'MyString' }
    name { 'MyString' }
    password_digest { 'MyString' }
    phone_number { 'MyString' }
  end
end
