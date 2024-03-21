require "test_helper"

class RedemptionHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @redemption_history = redemption_histories(:one)
  end

  test "should get index" do
    get redemption_histories_url
    assert_response :success
  end
end
