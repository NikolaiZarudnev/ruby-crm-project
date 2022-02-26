# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
describe '#Order', type: :feature do
  before do
    @user = create(:user, email: 'user1@gmail.com', password: 'password', name: 'User1')
  end

  context 'action' do
    it 'new' do
      product = create(:product, hidden: false)
      visit 'users/sign_in'
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit "/suppliers/#{product.supplier.id}/products/#{product.id}/orders/new"
      expect(page).to have_text('Count product')
    end
    it 'create' do
      product = create(:product, hidden: false)
      visit 'users/sign_in'
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit "/suppliers/#{product.supplier.id}/products/#{product.id}/orders/new"
      fill_in 'order_count_product', with: '1'
      click_button 'Create Order'
      expect(current_path).to eq(root_path)
    end
  end
end
