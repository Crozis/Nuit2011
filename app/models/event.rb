class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_and_belongs_to_many :users
  
  def budget
    Budget.where(:event_id => self.id).collect{|b| b.amount}.inject(0) { |s,v| s += v }
  end
end
