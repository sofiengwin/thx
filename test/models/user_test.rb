require "test_helper"

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "when redeeming points is successfully" do
    user = users(:one)
    reward = rewards(:one)
    user.user_rewards.destroy_all

    assert user.redeem(reward)
    assert_equal user.points, 900
  end

  test 'when user has already redeemed reward' do
    user = users(:one)
    reward = rewards(:one)
  
    # A user reward record has already been created for this reward and user combination
    assert user.user_rewards.exists?(reward_id: reward.id)

    refute user.redeem(reward)
    # User's point does not change
    assert_equal user.points, 1000
  end

  test 'when user does not have enough points to redeem record' do
    user = users(:one)
    reward = rewards(:one)
    user.update(points: 50)
    user.user_rewards.destroy_all

    refute user.redeem(reward)
    # User's point does not change
    assert_equal user.points, 50
  end
end

