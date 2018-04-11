require 'test_helper'

class LottoControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get lotto_home_url
    assert_response :success
  end

  test "should get index" do
    get lotto_index_url
    assert_response :success
  end

end
