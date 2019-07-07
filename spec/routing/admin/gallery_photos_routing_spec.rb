require "rails_helper"

RSpec.describe Admin::GalleryPhotosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/gallery_photos").to route_to("admin/gallery_photos#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/gallery_photos/new").to route_to("admin/gallery_photos#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/gallery_photos/1").to route_to("admin/gallery_photos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/gallery_photos/1/edit").to route_to("admin/gallery_photos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/gallery_photos").to route_to("admin/gallery_photos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/gallery_photos/1").to route_to("admin/gallery_photos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/gallery_photos/1").to route_to("admin/gallery_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/gallery_photos/1").to route_to("admin/gallery_photos#destroy", :id => "1")
    end
  end
end
