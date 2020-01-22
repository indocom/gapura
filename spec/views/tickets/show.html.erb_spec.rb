# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tickets/show', type: :view do
  before(:each) { @ticket = assign(:ticket, Ticket.create!) }

  it 'renders attributes in <p>' do
    render
  end
end
