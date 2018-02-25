require "rails_helper"

RSpec.describe Api::V1::OptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/options").to route_to("api/v1/options#index")
    end


    it "routes to #show" do
      expect(:get => "/v1/options/1").to route_to("api/v1/options#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/v1/options").to route_to("api/v1/options#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/options/1").to route_to("api/v1/options#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/options/1").to route_to("api/v1/options#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/options/1").to route_to("api/v1/options#destroy", :id => "1")
    end

  end
end
