class Reward < ApplicationRecord
  has_many :user_rewards, dependent: :destroy
  has_many :users, through: :user_rewards

  validates :title, presence: true
  validates :value, presence: true
end
