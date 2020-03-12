require 'test_helper'

class ChocItsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get choc_its_new_url
    assert_response :success
  end

end
