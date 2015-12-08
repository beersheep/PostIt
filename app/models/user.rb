class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes
  before_save :save_slug

  validates :password, confirmation: true, presence:true, length: {minimum: 6}, on: :create
  validates :username, length: {minimum: 3}, presence:true, uniqueness: true

  has_secure_password validations: false

  def save_slug
    self.slug = self.username.rstrip.gsub(/\W/, "-").downcase
  end

  def to_param
    self.slug
  end

end