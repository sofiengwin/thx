class AddUserIdIndexToRedemptionHistory < ActiveRecord::Migration[7.1]
  def change
    add_index :redemption_histories, :user_id
  end
end
