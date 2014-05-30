class AddStatusColumnToHomeworksTable < ActiveRecord::Migration
  def change
  	add_column :homeworks, :status, :string, :default => "new"
  end
end
