class CreateGiftIdeas < ActiveRecord::Migration
  def change
    create_table :gift_ideas do |t|

      t.timestamps
    end
  end
end
