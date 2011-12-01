class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.string :victim
      t.text :description
      t.date :due_date

      t.timestamps
    end
  end
end
