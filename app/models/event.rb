class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_and_belongs_to_many :users
  has_many :gift_ideas
  has_many :products, :through => :gift_ideas
  
  def budget
    Budget.where(:event_id => self.id).collect{|b| b.amount}.inject(0) { |s,v| s += v }
  end
  
  def products
  end
end
