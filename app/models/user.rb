class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes
  before_save :save_slug

  validates :password, confirmation: true, presence:true, length: {minimum: 6}, on: :create
  validates :username, length: {minimum: 3}, presence:true, uniqueness: true

  has_secure_password validations: false

  def generate_slug
    self.slug = self.username.strip.gsub(/\W/, "-").downcase
  end

  def save_slug
    generate_slug

    if !User.find_by(slug: self.slug).nil?
      if self.slug.match(/-\d*$/) == nil 
        self.slug = self.slug + "-01"
      else
        self.slug.sub!(/-\d*$/) {|n| n.succ}
      end
    end
  end

  def to_param
    self.slug
  end

end