class Homework < ActiveRecord::Base
	belongs_to :user
	belongs_to :assignment
	has_many :comments, as: :commentable
	validates_presence_of :assignment_id
end