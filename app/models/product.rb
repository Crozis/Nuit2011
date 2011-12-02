class Product < ActiveRecord::Base
  has_many :gift_ideas
  has_many :events, :through => :gift_ideas
end
