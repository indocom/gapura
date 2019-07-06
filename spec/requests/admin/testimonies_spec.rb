require 'rails_helper'

RSpec.describe "Admin::Testimonies", type: :request do
  describe "GET /admin/testimonies" do
    it "works! (now write some real specs)" do
      get admin_testimonies_path
      expect(response).to have_http_status(200)
    end
  end
end
