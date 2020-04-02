class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :usertofollow, null: false, index: true

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :usertofollow_id
  end
end
