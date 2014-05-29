class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.string :title
    	t.integer :user_id
    	t.integer :homework_id
    	t.string :github_link
    	t.string :heroku_link
    	t.string :notes
    end
  end
end
