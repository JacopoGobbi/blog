class FollowRelation < ActiveRecord::Base
  belongs_to :user_following, class_name: "User"
  belongs_to :user_followed, class_name: "User"
  validates :user_following_id, presence: true
  validates :user_followed_id, presence: true

end
