class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  
  def budget
    Budget.where(:event_id => 1).collect{|b| b.amount}.inject(0) { |s,v| s += v }
  end
end
