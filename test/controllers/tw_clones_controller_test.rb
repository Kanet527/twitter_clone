require 'test_helper'

class TwClonesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tw_clones_index_url
    assert_response :success
  end

end
