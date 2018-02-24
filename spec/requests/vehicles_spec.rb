require 'rails_helper'

RSpec.describe "Vehicles", type: :request do
  describe "GET /vehicles" do
    let!(:car) { create :car }
    let!(:truck) { create :truck }
    it "works! (now write some real specs)" do
      get vehicles_path
      expect(response).to have_http_status(200)
    end

    it "returns all of the vehicles" do
      get vehicles_path
      expect(response.body).to include('Truck')
      expect(response.body).to include('Car')
    end
  end
end
