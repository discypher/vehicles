require 'rails_helper'

RSpec.describe Make, type: :model do
  it { is_expected.to respond_to :manufacturer }
  it { is_expected.to respond_to :models }

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

  context 'models' do
    let(:model1) { create :model }
    let(:model2) { create :model }
    let(:make) { create :make }

    it 'can be many' do
      make.models << model1
      make.models << model2
      expect(make.models.count).to be 2
    end
  end
end
