require 'rails_helper'

RSpec.describe "admin/frequently_asked_questions/index", type: :view do
  before(:each) do
    assign(:admin_frequently_asked_questions, [
      Admin::FrequentlyAskedQuestion.create!(
        :question => "Question",
        :answer => "MyText"
      ),
      Admin::FrequentlyAskedQuestion.create!(
        :question => "Question",
        :answer => "MyText"
      )
    ])
  end

  it "renders a list of admin/frequently_asked_questions" do
    render
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
