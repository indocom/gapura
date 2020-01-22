# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/sponsors/edit', type: :view do
  before(:each) do
    @admin_sponsor =
      assign(
        :admin_sponsor,
        Admin::Sponsor.create!(year: 1, type: '', name: 'MyString')
      )
  end

  it 'renders the edit admin_sponsor form' do
    render

    assert_select 'form[action=?][method=?]',
                  admin_sponsor_path(@admin_sponsor),
                  'post' do
      assert_select 'input[name=?]', 'admin_sponsor[year]'

      assert_select 'input[name=?]', 'admin_sponsor[type]'

      assert_select 'input[name=?]', 'admin_sponsor[name]'
    end
  end
end
