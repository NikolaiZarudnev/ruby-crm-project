# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
describe '#Supplier', type: :feature do
  
  context 'action' do
    it 'new' do
      visit '/users/sign_up'

      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_name', with: 'user1'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign up'
      
      visit '/suppliers/new'
      
      fill_in 'supplier_company', with: 'test'

      click_button 'Create Supplier'
      expect(page).to have_text('test')
    end
    it 'update' do
      supplier = create(:supplier)
      visit "/suppliers/#{supplier.id}/edit"

      fill_in 'supplier_company', with: 'update test'
      click_button 'Update Supplier'
      expect(page).to have_text('update test')
    end
  end
end
