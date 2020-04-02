class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :opinions
  has_many :likes, dependent: :destroy

  has_many :followerships, class_name: 'Following', foreign_key: :user_id, dependent: :delete_all
  has_many :inverse_followerships, class_name: 'Following', foreign_key: :follower_id, dependent: :delete_all
  has_many :followed_users2, through: :inverse_followerships, source: :user
  has_many :followers2, through: :followerships, source: :follower

  # create template User.new(username: "Leo", full_name: "Leonardo David Mezu Lobato", password: "123456", password_confirmation: "123456", email: "leo7xs@gmail.com")

  # User.new(username: "Juan", full_name: "Juan Camilo", password: "123456", password_confirmation: "123456", email: "leo8xs@gmaiil.com").save

  def followers
    followerships.map { |fr| fr.follower }.compact
  end

  def followed_users
     inverse_followerships.map { |fr| fr.user }.compact
  end

end
