require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'valid title' do
    product = create(:product)
    expect(product).to be_valid
  end
end
