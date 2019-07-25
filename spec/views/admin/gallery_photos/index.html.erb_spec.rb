require 'rails_helper'

RSpec.describe "admin/gallery_photos/index", type: :view do
  before(:each) do
    assign(:admin_gallery_photos, [
      Admin::GalleryPhoto.create!(),
      Admin::GalleryPhoto.create!()
    ])
  end

  it "renders a list of admin/gallery_photos" do
    render
  end
end
