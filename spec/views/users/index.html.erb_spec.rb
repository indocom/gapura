# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) { assign(:users, [User.create!, User.create!]) }

  it 'renders a list of users' do
    render
  end
end
