# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/testimonies/show', type: :view do
  before(:each) do
    @admin_testimony =
      assign(
        :admin_testimony,
        Admin::Testimony.create!(
          name: 'Name', profession: 'Profession', testimony: 'MyText'
        )
      )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Profession/)
    expect(rendered).to match(/MyText/)
  end
end
