require "rails_helper"

RSpec.describe MakesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/makes").to route_to("makes#index")
    end


    it "routes to #show" do
      expect(:get => "/makes/1").to route_to("makes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/makes").to route_to("makes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/makes/1").to route_to("makes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/makes/1").to route_to("makes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/makes/1").to route_to("makes#destroy", :id => "1")
    end

  end
end
