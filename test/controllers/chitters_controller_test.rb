require 'test_helper'

class ChittersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chitters_index_url
    assert_response :success
  end

end
