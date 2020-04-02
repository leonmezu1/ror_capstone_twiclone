class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :opinions
  has_many :likes, dependent: :destroy

  has_many :followerships, class_name: 'Following', foreign_key: :user_id, dependent: :delete_all
  has_many :inverse_followerships, class_name: 'Following', foreign_key: :follower_id, dependent: :delete_all
  has_many :followed_users, through: :inverse_followerships, source: :user
  has_many :followers, through: :followerships, source: :follower

  # validations

  validates :username, presence: true, length: { minimum: 4, maximum: 20 }, unique: true
  validates :full_name, presence: true, length: {mimium: 7, maximum: 50}
  validates :email, presence: true, unique: true

end
