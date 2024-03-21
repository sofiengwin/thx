class RewardsController < ApplicationController
  def index
    @redeemed_rewards = current_user.rewards
    @rewards = Reward.left_joins(:user_rewards).where.not(id: @redeemed_rewards.map(&:id))
  end
  
  def redeem
    reward = Reward.find(params[:reward_id])

    if current_user.redeem(reward)
      flash[:notice] = "Reward was successfully redeemed."
    else
      flash[:notice] = "Error redeeming reward"
    end

    # This is hack to ensure the rewards are reloaded after any reward is redeemed
    redirect_to rewards_url
  end
end
