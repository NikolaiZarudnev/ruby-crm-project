require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it 'valid company' do
    supplier = create(:supplier)
    expect(supplier).to be_valid
  end
end
