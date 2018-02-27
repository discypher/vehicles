require 'rails_helper'

RSpec.describe Api::V1::VehiclesController, type: :controller do
  let(:make) { create :make }
  let(:model) { create :model }
  let(:valid_attributes) {
    {
      make: make,
      model: model,
      owner: "Joe",
      miles: 100_000,
      vin: "1234asdf4321fdsa",
      condition: "Poor"
    }
  }

  let(:invalid_attributes) {
    {
      make: nil,
      model: nil,
      owner: nil,
      vin: nil,
      condition: nil
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Vehicle.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      vehicle = Vehicle.create! valid_attributes
      get :show, params: {id: vehicle.to_param},session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Vehicle" do
        expect {
          post :create, params: { vehicle: build_attributes(:vehicle)}, session: valid_session
        }.to change(Vehicle, :count).by(1)
      end

      it "renders a JSON response with the new vehicle" do
        post :create, params: { vehicle: build_attributes(:vehicle)}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(v1_vehicle_url(Vehicle.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new vehicle" do
        post :create, params: {vehicle: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { owner: "Frank" }
      }

      it "updates the requested vehicle" do
        vehicle = Vehicle.create! valid_attributes
        put :update, params: {id: vehicle.to_param, vehicle: new_attributes}, session: valid_session
        vehicle.reload
        expect(vehicle.owner).to eq "Frank"
      end

      it "renders a JSON response with the vehicle" do
        vehicle = Vehicle.create! valid_attributes

        put :update, params: {id: vehicle.to_param, vehicle: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
    context "with invalid params" do
      it "renders a JSON response with errors for the vehicle" do
        vehicle = Vehicle.create! valid_attributes

        put :update, params: {id: vehicle.to_param, vehicle: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested vehicle" do
      vehicle = Vehicle.create! valid_attributes
      expect {
        delete :destroy, params: {id: vehicle.to_param}, session: valid_session
      }.to change(Vehicle, :count).by(-1)
    end
  end
end
