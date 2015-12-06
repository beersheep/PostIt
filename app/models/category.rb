class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories
  before_save :save_slug

  validates :name, presence: true, uniqueness: true

  def save_slug
    self.slug = self.name.gsub(/\W/, "-")
  end

  def to_param
    self.slug
  end
end