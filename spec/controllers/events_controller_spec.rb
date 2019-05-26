require 'rails_helper'

RSpec.describe EventsController, type: :controller do
    describe "GET #index" do
        it 'should display past events' do
            get :index
            assert_template :index
        end
    end
end
