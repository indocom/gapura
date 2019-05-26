require 'test_helper'

class PastEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get past_events_index_url
    assert_response :success
  end

end
