require 'rails_helper'

RSpec.describe "admin/frequently_asked_questions/show", type: :view do
  before(:each) do
    @admin_frequently_asked_question = assign(:admin_frequently_asked_question, Admin::FrequentlyAskedQuestion.create!(
      :question => "Question",
      :answer => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question/)
    expect(rendered).to match(/MyText/)
  end
end
