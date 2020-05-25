# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/sponsors/show', type: :view do
  before(:each) do
    @admin_sponsor =
      assign(
        :admin_sponsor,
        Admin::Sponsor.create!(year: 2, type: 'Type', name: 'Name')
      )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Name/)
  end
end
