require 'rails_helper'

RSpec.describe "Makes", type: :request do
  describe "GET /makes" do
    let!(:make) { create :make, manufacturer: 'Tesla' }
    let!(:make2) { create :make, manufacturer: 'Toyota'}

    it "works! (now write some real specs)" do
      get makes_path
      expect(response).to have_http_status(200)
    end

    it "returns a list of Makes" do
      get makes_path
      expect(response.body).to include('Tesla')
      expect(response.body).to include('Toyota')
    end
  end
end
