class Post < ActiveRecord::Base
  include Voteable
  
  belongs_to :creator, foreign_key:'user_id', class_name:'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  before_save :save_slug

  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, uniqueness: true 
  validates :categories, presence: true


  def generate_slug
    self.slug = self.title.strip.gsub(/\W/, "-").downcase
  end

  def save_slug
    generate_slug

    if !Post.find_by(slug: self.slug).nil?
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