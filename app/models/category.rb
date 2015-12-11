class Category < ActiveRecord::Base
  include Slugging

 
  has_many :post_categories
  has_many :posts, through: :post_categories
  
  validates :name, presence: true, uniqueness: true

  slugging_column :name


end