require 'rails_helper'

RSpec.describe ListProduct, type: :model do
  context 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:list) }
  end
end
