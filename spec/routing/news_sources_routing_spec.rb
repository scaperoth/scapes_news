require "rails_helper"

RSpec.describe NewsSourcesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/news_sources").to route_to("news_sources#index")
    end

    it "routes to #new" do
      expect(:get => "/news_sources/new").to route_to("news_sources#new")
    end

    it "routes to #show" do
      expect(:get => "/news_sources/1").to route_to("news_sources#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/news_sources/1/edit").to route_to("news_sources#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/news_sources").to route_to("news_sources#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/news_sources/1").to route_to("news_sources#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/news_sources/1").to route_to("news_sources#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/news_sources/1").to route_to("news_sources#destroy", :id => "1")
    end

  end
end
