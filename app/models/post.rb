class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key:'user_id', class_name:'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable
  before_save :save_slug

  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, uniqueness: true 
  validates :categories, presence: true

  def save_slug
    self.slug = self.title.rstrip.gsub(/\W/, "-").downcase
  end

  def to_param
    self.slug
  end

end