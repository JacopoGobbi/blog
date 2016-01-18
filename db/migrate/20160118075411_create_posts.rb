class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
    add_reference :posts, :user, index: true, foreign_key: true
  end
end
