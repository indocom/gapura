# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/testimonies/new', type: :view do
  before(:each) do
    assign(
      :admin_testimony,
      Admin::Testimony.new(
        name: 'MyString', profession: 'MyString', testimony: 'MyText'
      )
    )
  end

  it 'renders new admin_testimony form' do
    render

    assert_select 'form[action=?][method=?]', admin_testimonies_path, 'post' do
      assert_select 'input[name=?]', 'admin_testimony[name]'

      assert_select 'input[name=?]', 'admin_testimony[profession]'

      assert_select 'textarea[name=?]', 'admin_testimony[testimony]'
    end
  end
end
