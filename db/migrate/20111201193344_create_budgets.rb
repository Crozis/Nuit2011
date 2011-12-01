class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :user_id
      t.integer :event_id
      t.float :amount

      t.timestamps
    end
  end
end
