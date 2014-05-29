class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string :title
    	t.string :description
    end
  end
end
