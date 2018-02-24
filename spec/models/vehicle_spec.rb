require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { is_expected.to respond_to :kind }

  context 'with nil kind' do
    let(:car) { build :car }

    it 'is invalid' do
      car.kind = nil
      expect(car).not_to be_valid
    end
  end
  context 'that exists' do
    let!(:car) { create :car }
    let(:car2) { build :car }

    it 'cannot be duplicated' do
      expect(car2).not_to be_valid
    end
  end
end
