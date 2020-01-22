# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/sponsors/index', type: :view do
  before(:each) do
    assign(
      :admin_sponsors,
      [
        Admin::Sponsor.create!(year: 2, type: 'Type', name: 'Name'),
        Admin::Sponsor.create!(year: 2, type: 'Type', name: 'Name')
      ]
    )
  end

  it 'renders a list of admin/sponsors' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 'Type'.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
  end
end
