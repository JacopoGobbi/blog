class User < ActiveRecord::Base
  has_many :follow_relations,
    class_name: "FollowRelation",
    foreign_key: "user_following_id",
    dependent: :destroy
  has_many :followers, through: :follow_relations, source: :user_following
  has_many :following, through: :follow_relations, source: :user_followed

  def follow(user)
    follow_relations.create(user_followed_id: user.id)
  end
  def unfollow(user)
    follow_relations.find_by(user_followed_id: user.id).destroy
  end
  def following?(user)
    following.include?(user)
  end
end
