class ChangeFirstNameToFirstname < ActiveRecord::Migration
  def up
    rename_column :user, :first_name, :firstname
    rename_column :user, :last_name, :lastname
  end

  def down
    rename_column :user, :firstname, :first_name
    rename_column :user, :lastname, :last_name
  end
end
