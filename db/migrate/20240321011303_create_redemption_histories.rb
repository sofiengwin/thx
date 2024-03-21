class CreateRedemptionHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :redemption_histories do |t|
      t.string :reward_name
      t.integer :reward_id
      t.integer :reward_value
      t.integer :user_id
      t.string :user_name

      t.timestamps
    end
  end
end
