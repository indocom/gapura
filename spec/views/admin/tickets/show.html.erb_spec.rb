# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/tickets/show', type: :view do
  before(:each) { @admin_ticket = assign(:admin_ticket, Admin::Ticket.create!) }

  it 'renders attributes in <p>' do
    render
  end
end
