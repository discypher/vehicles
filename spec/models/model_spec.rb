require 'rails_helper'

RSpec.describe Model, type: :model do
  it { is_expected.to respond_to :vehicle }
  it { is_expected.to respond_to :make }
  it { is_expected.to respond_to :base_cost }
  it { is_expected.to respond_to :name }

  context 'vehicles' do
    let(:model) { build :model }

    it 'should not be nil' do
      model.vehicle = nil
      expect(model).not_to be_valid
    end
  end

  context 'make' do
    let(:model) { build :model }

    it ' should not be nil' do
      model.make = nil
      expect(model).not_to be_valid
    end
  end

  context 'name' do
    let(:model) { build :model }

    it 'should not be nil' do
      model.name = nil
      expect(model).not_to be_valid
    end
  end

  context 'base_cost' do
    let(:model) { build :model }

    it 'should not be nil' do
      model.base_cost = nil
      expect(model).not_to be_valid
    end
  end
end
