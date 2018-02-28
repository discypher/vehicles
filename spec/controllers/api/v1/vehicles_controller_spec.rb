require 'rails_helper'

RSpec.describe Api::V1::VehiclesController, type: :controller do
  let(:make) { create :make }
  let(:model) { create :model }
  let(:option1) { create :option }
  let(:option2) { create :option }
  let(:vehicle) { create :vehicle}
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

  let(:valid_post_data) {
    {
      "data"=> {
        "type"=>"vehicles",
        "attributes"=> {
          "vin"=>"1234asdf4321fdsa",
          "owner"=>"Joe Schmoe",
          "miles"=>123_432,
          "condition"=>"Like New"
        },
        "relationships"=>{
          "make"=>{
            "data"=> { "type"=> "makes", "id"=> make.id }
          },
          "model"=>{
            "data"=> { "type"=> "models", "id"=> model.id }
          },
          "options"=> {
            "data"=> [
              { "type"=> "options", "id"=> option1.id },
              { "type"=> "options", "id"=> option2.id }
            ]
          }
        }
      }
    }
  }

  let(:invalid_post_data) {
    {
      "data"=> {
        "type"=>"vehicles",
        "attributes"=> {
          "vin"=>"1234asdf4321fdsa",
          "owner"=>nil,
          "miles"=>100_000,
          "condition"=>"Like New"
        },
        "relationships"=>{
          "make"=>{
            "data"=> { "type"=> "makes", "id"=> make.id }
          },
          "model"=>{
            "data"=> { "type"=> "models", "id"=> model.id }
          },
          "options"=> {
            "data"=> [
              { "type"=> "options", "id"=> option1.id },
              { "type"=> "options", "id"=> option2.id }
            ]
          }
        }
      }
    }
  }

  let(:valid_patch_data) {
    {
      "id"=> vehicle.id,
      "data"=> {
        "id"=> vehicle.id,
        "type"=>"vehicles",
        "attributes"=> {
          "vin"=>"1234asdf4321fdsa",
          "owner"=>"Joe Schmoe",
          "miles"=>123_432,
          "condition"=>"Poor"
        },
        "relationships"=>{
          "make"=>{
            "data"=> { "type"=> "makes", "id"=> make.id }
          },
          "model"=>{
            "data"=> { "type"=> "models", "id"=> model.id }
          },
          "options"=> {
            "data"=> [
              { "type"=> "options", "id"=> option1.id },
              { "type"=> "options", "id"=> option2.id }
            ]
          }
        }
      }
    }
  }

  let(:invalid_patch_data) {
    {
      "id"=> vehicle.id,
      "data"=> {
        "id"=> vehicle.id,
        "type"=>"vehicles",
        "attributes"=> {
          "vin"=>"1234asdf4321fdsa",
          "owner"=>nil,
          "miles"=>123_432,
          "condition"=>"Poor"
        },
        "relationships"=>{
          "make"=>{
            "data"=> { "type"=> "makes", "id"=> make.id }
          },
          "model"=>{
            "data"=> { "type"=> "models", "id"=> model.id }
          },
          "options"=> {
            "data"=> [
              { "type"=> "options", "id"=> option1.id },
              { "type"=> "options", "id"=> option2.id }
            ]
          }
        }
      }
    }
  }

  let(:valid_session) { {} }
  let(:valid_headers) { {'Content-Type' => 'application/vnd.api+json'} }

  describe "GET #index" do
    it "returns a success response" do
      request.headers.merge! valid_headers
      Vehicle.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      request.headers.merge! valid_headers
      vehicle = Vehicle.create! valid_attributes
      get :show, params: {id: vehicle.to_param},session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Vehicle" do
        request.headers.merge! valid_headers
        expect {
          post :create, params: valid_post_data, session: valid_session
        }.to change(Vehicle, :count).by(1)
      end

      it "renders a JSON response with the new vehicle" do
        request.headers.merge! valid_headers
        post :create, params: valid_post_data, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/vnd.api+json')
        expect(response.location).to eq(api_v1_vehicle_url(Vehicle.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new vehicle" do
        request.headers.merge! valid_headers
        post :create, params: invalid_post_data, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/vnd.api+json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested vehicle" do
        request.headers.merge! valid_headers
        patch :update, params: valid_patch_data, session: valid_session
        vehicle.reload
        expect(vehicle.condition).to eq "Poor"
      end

      it "renders a JSON response with the vehicle" do
        request.headers.merge! valid_headers
        patch :update, params: valid_patch_data, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/vnd.api+json')
      end
    end
    context "with invalid params" do
      it "renders a JSON response with errors for the vehicle" do
        request.headers.merge! valid_headers
        patch :update, params: invalid_patch_data, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/vnd.api+json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested vehicle" do
      request.headers.merge! valid_headers
      vehicle = Vehicle.create! valid_attributes
      expect {
        delete :destroy, params: {id: vehicle.to_param}, session: valid_session
      }.to change(Vehicle, :count).by(-1)
    end
  end
end
