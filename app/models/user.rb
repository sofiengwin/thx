class User < ApplicationRecord
  has_many :user_rewards, dependent: :destroy
  has_many :rewards, through: :user_rewards

  def redeem(reward)
    return false if redeemed?(reward)
    points_after_redeeming_reward = points - reward.value

    return false if points_after_redeeming_reward < 0

    ActiveRecord::Base.transaction do 
      user_rewards.create(reward: reward)
      create_redemption_history(reward)
      update(points: points_after_redeeming_reward)
    end
    true
  rescue ActiveRecord::Rollback => e
    Rails.logger.error("#{e.message}")
    false
  end

  def create_redemption_history(reward)
    RedemptionHistory.create(
      reward_name: reward.title,
      reward_id: reward.id,
      reward_value: reward.value,
      user_id: id,
      user_name: name
    )
  end

  def redeemed?(reward)
    user_rewards.exists?(reward_id: reward.id)
  end
end
