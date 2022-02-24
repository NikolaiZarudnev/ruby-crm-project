require 'rails_helper'

describe 'the log in process', type: :feature do
  before :each do
    User.create(email: 'user1@gmail.com', password: 'password', name: 'User1')
  end
  it 'log @user in' do
    visit 'users/sign_in'
    fill_in 'user_email', with: 'user1@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Здравствуйте, User1')
  end
end
