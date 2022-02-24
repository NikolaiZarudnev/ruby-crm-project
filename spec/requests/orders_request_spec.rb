require 'rails_helper'

RSpec.describe 'Orders', type: :request do
end
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'Request index' do
    subject = 123
    it 'assigns order count products' do
      order = Order.create(count_product: 123)

      expect(subject).to eq(order.count_product)
    end
  end
end
