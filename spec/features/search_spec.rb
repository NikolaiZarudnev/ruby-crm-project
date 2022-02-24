require 'rails_helper'

describe 'the search process', type: :feature do
  before do
    Product.create(title: 'test')
  end

  it 'search test' do
    visit '/users/sign_up'

      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_name', with: 'user1'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign up'
    visit '/'
    fill_in 'Поиск', with: 'test'
    click_button 'Поиск'
    expect(page).to have_current_path('/search?q=test')
    expect(page).to have_text('Результаты поиска')
  end
end
