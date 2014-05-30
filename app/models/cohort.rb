class Cohort < ActiveRecord::Base
	belongs_to :location
	belongs_to :course
	has_many :users, through: :enrollments
	has_many :assignments
	
	has_many :enrollments
end