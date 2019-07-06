require 'rails_helper'

RSpec.describe "admin/testimonies/edit", type: :view do
  before(:each) do
    @admin_testimony = assign(:admin_testimony, Admin::Testimony.create!(
      :name => "MyString",
      :profession => "MyString",
      :testimony => "MyText"
    ))
  end

  it "renders the edit admin_testimony form" do
    render

    assert_select "form[action=?][method=?]", admin_testimony_path(@admin_testimony), "post" do

      assert_select "input[name=?]", "admin_testimony[name]"

      assert_select "input[name=?]", "admin_testimony[profession]"

      assert_select "textarea[name=?]", "admin_testimony[testimony]"
    end
  end
end
