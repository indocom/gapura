# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) { @user = assign(:user, User.create!) }

  it 'renders attributes in <p>' do
    render
  end
end
