require "rails_helper"

RSpec.describe Api::V1::ModelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/models").to route_to("api/v1/models#index")
    end


    it "routes to #show" do
      expect(:get => "/v1/models/1").to route_to("api/v1/models#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/v1/models").to route_to("api/v1/models#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/models/1").to route_to("api/v1/models#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/models/1").to route_to("api/v1/models#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/models/1").to route_to("api/v1/models#destroy", :id => "1")
    end

  end
end
