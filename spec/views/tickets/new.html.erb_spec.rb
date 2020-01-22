# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tickets/new', type: :view do
  before(:each) { assign(:ticket, Ticket.new) }

  it 'renders new ticket form' do
    render

    assert_select 'form[action=?][method=?]', tickets_path, 'post' do
    end
  end
end
