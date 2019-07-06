require "rails_helper"

RSpec.describe Admin::TestimoniesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/testimonies").to route_to("admin/testimonies#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/testimonies/new").to route_to("admin/testimonies#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/testimonies/1").to route_to("admin/testimonies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/testimonies/1/edit").to route_to("admin/testimonies#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/testimonies").to route_to("admin/testimonies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/testimonies/1").to route_to("admin/testimonies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/testimonies/1").to route_to("admin/testimonies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/testimonies/1").to route_to("admin/testimonies#destroy", :id => "1")
    end
  end
end
