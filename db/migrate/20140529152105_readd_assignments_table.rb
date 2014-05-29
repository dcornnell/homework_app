class ReaddAssignmentsTable < ActiveRecord::Migration
  def change
  	create_table :assignments do |t|
    	t.string :name
    	t.date :due_date
    	t.integer :cohort_id
    	t.string :description
    end
  end
end


