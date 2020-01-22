# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/frequently_asked_questions/edit', type: :view do
  before(:each) do
    @admin_frequently_asked_question =
      assign(
        :admin_frequently_asked_question,
        Admin::FrequentlyAskedQuestion.create!(
          question: 'MyString', answer: 'MyText'
        )
      )
  end

  it 'renders the edit admin_frequently_asked_question form' do
    render

    assert_select 'form[action=?][method=?]',
                  admin_frequently_asked_question_path(
                    @admin_frequently_asked_question
                  ),
                  'post' do
      assert_select 'input[name=?]', 'admin_frequently_asked_question[question]'

      assert_select 'textarea[name=?]',
                    'admin_frequently_asked_question[answer]'
    end
  end
end
