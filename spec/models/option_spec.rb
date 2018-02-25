require 'rails_helper'

RSpec.describe Option, type: :model do
  it { is_expected.to respond_to :cost }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description}
  it { is_expected.to respond_to :models }

  context 'cost' do
    let(:option) { build :option }

    it 'cannot be nil' do
      option.cost = nil
      expect(option).not_to be_valid
    end

    it 'must be a number' do
      option.cost = 'dog'
      expect(option).not_to be_valid
    end
  end

  context 'name' do
    let(:option) { build :option }

    it 'cannot be nil' do
      option.name = nil
      expect(option).not_to be_valid
    end
  end

  context 'description' do
    let(:option) { build :option }

    it 'cannot be nil' do
      option.description = nil
      expect(option).not_to be_valid
    end
  end

  context 'models' do
    let(:model1) { create :model }
    let(:model2) { create :model }
    let(:option) { create :option }

    it 'can be more than one' do
      option.models << model1
      option.models << model2
      expect(option.models.count).to be 2
    end
  end
end
