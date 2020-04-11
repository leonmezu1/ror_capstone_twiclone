class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :opinions, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :followerships, class_name: 'Following', foreign_key: :user_id, dependent: :destroy
  has_many :inverse_followerships, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy
  has_many :followed_users, through: :inverse_followerships, source: :user
  has_many :followers, through: :followerships, source: :follower

  # validations

  validates :username, presence: true, length: { minimum: 4, maximum: 20 }, uniqueness: {case_sensitive: false}
  validates :full_name, presence: true, length: { minimum: 7, maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4, maximum: 20 }

end
