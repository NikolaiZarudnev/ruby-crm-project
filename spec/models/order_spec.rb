require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'valid count_product' do
    order = create(:order, count_product: 123)
    expect(order).to be_valid
  end
end