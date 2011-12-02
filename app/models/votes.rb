class Votes < ActiveRecord::Base
  has_one :user
  has_one :gift_idea
end
