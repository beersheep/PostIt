class Post < ActiveRecord::Base
  include Voteable
  include Slugging
  
  belongs_to :creator, foreign_key:'user_id', class_name:'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, uniqueness: true 
  validates :categories, presence: true

  slugging_column :title

  PER_PAGE = 4
end
