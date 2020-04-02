class Following < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, class_name: 'User'
  belongs_to :usertofollow, foreign_key: :usertofollow_id, class_name: 'User'
end
