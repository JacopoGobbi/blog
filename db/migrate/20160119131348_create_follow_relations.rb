class CreateFollowRelations < ActiveRecord::Migration
  def change
    create_table :follow_relations do |t|
      t.integer :user_following_id
      t.integer :user_followed_id

      t.timestamps null: false
    end
    add_index :follow_relations, :user_following_id
    add_index :follow_relations, :user_followed_id
    add_index :follow_relations, [
      :user_following_id,
      :user_followed_id
    ], unique: true

  end
end
