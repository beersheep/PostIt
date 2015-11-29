class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :password, confirmation: true, presence:true, length: {minimum: 6}
  validates :username, length: {minimum: 3}, presence:true, uniqueness: true


  has_secure_password validations: false
end