require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { is_expected.to respond_to :kind }

  context 'kind validations' do
    let(:car) { build :car }

    it 'checks for nil' do
      car.kind = nil
      expect(car).not_to be_valid
    end
  end

  context 'that exists' do
    let!(:car) { create :car }
    let(:car2) { build :car, kind: car.kind }

    it 'cannot be duplicated' do
      expect(car2).not_to be_valid
    end
  end
end
