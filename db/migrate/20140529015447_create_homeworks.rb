class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
    	t.string :name
    	t.date :due_date
    	t.integer :user_id
    	t.string :description
    end
  end
end
