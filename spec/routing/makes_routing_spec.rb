require "rails_helper"

RSpec.describe Api::V1::MakesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/makes").to route_to("api/v1/makes#index")
    end


    it "routes to #show" do
      expect(:get => "/v1/makes/1").to route_to("api/v1/makes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/v1/makes").to route_to("api/v1/makes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/makes/1").to route_to("api/v1/makes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/makes/1").to route_to("api/v1/makes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/makes/1").to route_to("api/v1/makes#destroy", :id => "1")
    end

  end
end
