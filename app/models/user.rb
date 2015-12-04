class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  validates :password, confirmation: true, presence:true, length: {minimum: 6}, on: :create
  validates :username, length: {minimum: 3}, presence:true, uniqueness: true

  has_secure_password validations: false

  def update_user
    if !self.new_record?
    end
  end

end