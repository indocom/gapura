# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET #index' do
    it 'should display home page' do
      get :index
      assert_template :index
    end
  end
end
