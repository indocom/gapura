# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tickets/edit', type: :view do
  before(:each) { @ticket = assign(:ticket, Ticket.create!) }

  it 'renders the edit ticket form' do
    render

    assert_select 'form[action=?][method=?]', ticket_path(@ticket), 'post' do
    end
  end
end
