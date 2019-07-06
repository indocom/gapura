require 'rails_helper'

RSpec.describe "admin/frequently_asked_questions/new", type: :view do
  before(:each) do
    assign(:admin_frequently_asked_question, Admin::FrequentlyAskedQuestion.new(
      :question => "MyString",
      :answer => "MyText"
    ))
  end

  it "renders new admin_frequently_asked_question form" do
    render

    assert_select "form[action=?][method=?]", admin_frequently_asked_questions_path, "post" do

      assert_select "input[name=?]", "admin_frequently_asked_question[question]"

      assert_select "textarea[name=?]", "admin_frequently_asked_question[answer]"
    end
  end
end
