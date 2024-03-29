class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname
  
  has_and_belongs_to_many :events
  has_many :budgets

  has_many :gift_ideas
  has_many :votes

  def event_budget(event)
    Budget.where(:event_id => event.id, :user_id => self).first
  end
  
  def subscribed_events
    self.events
  end

  def created_events
    Event.where(:creator_id => self.id)
  end

end
