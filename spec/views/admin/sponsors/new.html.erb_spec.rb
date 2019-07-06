require 'rails_helper'

RSpec.describe "admin/sponsors/new", type: :view do
  before(:each) do
    assign(:admin_sponsor, Admin::Sponsor.new(
      :year => 1,
      :type => "",
      :name => "MyString"
    ))
  end

  it "renders new admin_sponsor form" do
    render

    assert_select "form[action=?][method=?]", admin_sponsors_path, "post" do

      assert_select "input[name=?]", "admin_sponsor[year]"

      assert_select "input[name=?]", "admin_sponsor[type]"

      assert_select "input[name=?]", "admin_sponsor[name]"
    end
  end
end
