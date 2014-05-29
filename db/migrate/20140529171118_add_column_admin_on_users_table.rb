class AddColumnAdminOnUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :admin, :string, :default => "student"
  end
end
