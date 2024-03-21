# README

* Ruby version
```
  3.2.2
```

* How to start server

```
  bundle install
  bin/rails db:prepare
  bin/rails s
```

* How to run the test suite
```
  bin/rails test
```

* Approach: 
I tried to keep things a simple as possible in order to complete this as fast as possible, while taking into consideration some design decision that might impact the project as it scales.
I kept things simple by using sqlite database to make it easy for anyone reviewing to start the app.

This approach assumes the view will accessed by a logged_in user 

* Rationale:
The main deciding factor with this approach is that I want RedemptionHistories to be a separate concept from UserRewards.

* Data Model:
```
 User:
   This will include all information about users.

   User
    id
    name
    email
    point

  Reward:
  This will include all information about rewards.

  Reward
    id
    title
    expired_at

  UserReward:
  This will be a table that allows connecting of users to rewards they have already redeemed. I am making this separate from the redemption history table because this will only be used to reflect the current state of users and their redeemed rewards, so if a reward is removed or edited using this relationship will allow us to always have the current state of users and their rewards.

  RewardUser
    reward_id
    user_id

  RedemptionHistory:
  This table will hold all users redemption history. The idea is to use this as an append only table where the only operation allowed is creating new redemption history record. We don't want history here to change when there are changes to the reward or if the reward is removed.

  RedemptionHistory
    id
    user_id
    user_name
    reward_value
    reward_name
```


* Interface: In both of the pages listed above the user's current point balance will displayed at the top.
  Rewards Page: This will display a table showing details of all rewards, indicating if a reward is still available for redemption
  Redemption History Page: This will display a table showing details of all redemption history

* Things that are missing:
  - Better validation and error handling
  - User authentication/authorization system
  - System test for all functional requirments
  - UI could be better