# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Suppliers', type: :request do
  describe 'Request index' do
    subject = 'test'
    it 'assigns supplier company' do
      supplier = Supplier.create(company: 'test')

      expect(subject).to eq(supplier.company)
    end
  end
end
