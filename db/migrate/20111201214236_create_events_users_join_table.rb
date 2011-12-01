class CreateEventsUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :events_users, :id => false do |t|
      t.references :event, :user 
    end
  end
  def self.down
    drop_table :events_users
  end
end
