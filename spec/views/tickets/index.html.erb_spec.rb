# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tickets/index', type: :view do
  before(:each) { assign(:tickets, [Ticket.create!, Ticket.create!]) }

  it 'renders a list of tickets' do
    render
  end
end
