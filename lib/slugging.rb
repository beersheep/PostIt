# module Slugging
#   extend ActiveSupport::Concern

#   included do 
#     before_save :save_slug
#     class_attribute :slug_column
#   end

#   def generate_slug
#     self.slug = self.send(self.slug_column).strip.gsub(/\W/, "-").downcase
#   end

#   def save_slug
#     generate_slug

#     if !self.class.find_by(slug: self.slug).nil?
#       if self.slug.match(/-\d*$/) == nil 
#         self.slug = self.slug + "-01"
#       else
#         self.slug.sub!(/-\d*$/) {|n| n.succ}
#       end
#     end
#   end

#   def to_param
#     self.slug
#   end


#   module ClassMethods
#     def slugging_column(col_name)
#       self.slug_column = col_name
#     end
#   end
# end