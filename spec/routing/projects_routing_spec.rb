require "rails_helper"
require 'route_helper'

RSpec.describe V1::ProjectsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/projects").to json_route_to("projects#index")
    end

    it "routes to #show" do
      expect(:get => "/projects/1").to json_route_to("projects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/projects/1/edit").to json_route_to("projects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/projects").to json_route_to("projects#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/projects/1").to json_route_to("projects#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/projects/1").to json_route_to("projects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/projects/1").to json_route_to("projects#destroy", :id => "1")
    end

  end
end
