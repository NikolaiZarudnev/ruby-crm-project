require 'rails_helper'
require 'spec_helper'
describe 'the sign up process', type: :feature do
  it 'sign @user up' do
    visit '/users/sign_up'

    fill_in 'user_email', with: 'user1@gmail.com'
    fill_in 'user_name', with: 'user1'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(current_path).to eq('/')
    expect(page).to have_text('Здравствуйте, user1')
  end
end
