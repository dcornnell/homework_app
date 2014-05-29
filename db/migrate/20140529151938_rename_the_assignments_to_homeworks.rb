class RenameTheAssignmentsToHomeworks < ActiveRecord::Migration
  def change
  	rename_table :assignments, :homeworks
  end
end
