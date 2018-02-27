require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { is_expected.to respond_to :make }
  it { is_expected.to respond_to :model }
  it { is_expected.to respond_to :owner }
  it { is_expected.to respond_to :miles }
  it { is_expected.to respond_to :vin }
  it { is_expected.to respond_to :condition }
  it { is_expected.to respond_to :options }

  describe '#make' do

  end

  describe '#model' do

  end

  describe '#owner' do

  end

  describe '#miles' do

  end

  describe '#vin' do

  end

  describe '#condition' do

  end

  describe '#options' do

  end
end
