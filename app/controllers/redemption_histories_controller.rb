class RedemptionHistoriesController < ApplicationController
  def index
    @redemption_histories = RedemptionHistory.where(user_id: current_user.id)
  end
end
