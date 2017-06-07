require "rails_helper"

RSpec.describe MangementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mangements").to route_to("mangements#index")
    end

    it "routes to #new" do
      expect(:get => "/mangements/new").to route_to("mangements#new")
    end

    it "routes to #show" do
      expect(:get => "/mangements/1").to route_to("mangements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mangements/1/edit").to route_to("mangements#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mangements").to route_to("mangements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mangements/1").to route_to("mangements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mangements/1").to route_to("mangements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mangements/1").to route_to("mangements#destroy", :id => "1")
    end

  end
end
