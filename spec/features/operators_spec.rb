# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
describe '#User', type: :feature do
  before do
    @user = create(:user, email: 'user1@gmail.com', password: 'password', name: 'User1', is_operator: true)
  end
  context 'operator action' do
    it 'visit admin panel' do
      visit 'users/sign_in'
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit "/admin"
      expect(page).to have_text('Site Administration')
    end
    it 'update' do
      product = create(:product)
      visit 'users/sign_in'
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit "/suppliers/#{product.supplier.id}/products/#{product.id}/edit"

      fill_in 'product_title', with: 'update test'
      click_button 'Update Product'
      expect(page).to have_text('update test')
    end
  end
end
