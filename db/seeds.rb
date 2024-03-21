# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by(name: 'Tom Holland', email: 'test@example.com', points: 10000)

100.times do |n|
  Reward.create(title: "Promo #{n}", value: rand(1000...5000), expired_at: 10.days.from_now)
end


Reward.first(10).each do |reward|
  reward.user_rewards.create(user_id: user.id)
  user.create_redemption_history(reward)
end

puts "Created #{Reward.count} rewards"
puts "Created #{User.count} rewards"
puts "Created #{UserReward.count} rewards"
puts "Created #{RedemptionHistory.count} rewards"