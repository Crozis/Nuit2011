class GiftIdeas < ActiveRecord::Base
  has_one :event
  has_one :product
  has_one :user
end
