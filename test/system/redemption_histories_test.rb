require "application_system_test_case"

class RedemptionHistoriesTest < ApplicationSystemTestCase
  setup do
    @redemption_history = redemption_histories(:one)
  end

  test "visiting the index" do
    visit redemption_histories_url
    assert_selector "h1", text: "Redemption histories"
  end
end
