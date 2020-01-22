# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/testimonies/index', type: :view do
  before(:each) do
    assign(
      :admin_testimonies,
      [
        Admin::Testimony.create!(
          name: 'Name', profession: 'Profession', testimony: 'MyText'
        ),
        Admin::Testimony.create!(
          name: 'Name', profession: 'Profession', testimony: 'MyText'
        )
      ]
    )
  end

  it 'renders a list of admin/testimonies' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Profession'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
