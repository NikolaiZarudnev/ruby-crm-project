# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
describe '#Product', type: :feature do
  before do
    @supplier = build(:supplier, user: create(:user, email: 'user1@gmail.com', password: 'password', name: 'User1', is_supplier: true))
    @supplier.id = @supplier.user_id
    @supplier.save
  end

  context 'action' do
    it 'new' do
      visit 'users/sign_in'
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit "/suppliers/#{@supplier.id}/products/new"
      fill_in 'product_title', with: 'test'
      fill_in 'product_description', with: 'test'
      fill_in 'product_price', with: 10.0
      attach_file('product_image',
                  File.join(Rails.root, 'app/assets/images/none.jpg'))

      click_button 'Create Product'
      expect(current_path).to eq("/suppliers/#{@supplier.id}")
    end

    it 'update' do
      product = create(:product, supplier_id: @supplier.id)
      visit 'users/sign_in'
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'

      visit "/suppliers/#{@supplier.id}/products/#{product.id}/edit"

      fill_in 'product_title', with: 'update test'
      click_button 'Update Product'
      expect(page).to have_text('update test')
    end

    it 'show' do
      visit 'users/sign_in'
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      @product = create(:product, title: 'asdasd', supplier: @supplier)
      visit "/suppliers/#{@product.supplier_id}/products/#{@product.id}"
      
      expect(page).to have_text('asdasd')
    end
  end
end
