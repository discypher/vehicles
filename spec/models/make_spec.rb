require 'rails_helper'

RSpec.describe Make, type: :model do
  it { is_expected.to respond_to :manufacturer }

  context 'manufacturer validations' do
    let(:make) { build :make }

    it 'checks for nil' do
      make.manufacturer = nil
      expect(make).not_to be_valid
    end
  end

  context 'that exists' do
    let!(:make) { create :make }
    let(:make2) { build :make, manufacturer: make.manufacturer }

    it 'cannot be duplicated' do
      expect(make2).not_to be_valid
    end
  end
end
