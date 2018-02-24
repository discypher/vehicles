require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { is_expected.to respond_to :kind }

  context 'with invalid input' do
    let(:car) { create :car }

    it 'is invalid' do
      car.kind = nil
      expect(car).not_to be_valid
    end
  end
end
