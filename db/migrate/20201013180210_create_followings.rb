class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.timestamps
      t.index :follower_id
      t.index :followed_id
    end
  end
end
