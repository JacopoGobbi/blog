class User < ActiveRecord::Base
  has_many :follow_relations,
    class_name: "FollowRelation",
    foreign_key: "user_following_id",
    dependent: :destroy
  has_many :followers, through: :follow_relations, source: :user_following
  has_many :following, through: :follow_relations, source: :user_followed
end
