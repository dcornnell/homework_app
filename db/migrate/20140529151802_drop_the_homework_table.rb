class DropTheHomeworkTable < ActiveRecord::Migration
  def change
  	drop_table :homeworks
  end
end
