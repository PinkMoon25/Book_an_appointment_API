class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :boolean, :default => false, :null => true
  end
end
