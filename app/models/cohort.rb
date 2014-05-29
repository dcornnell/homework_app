class Cohort < ActiveRecord::Base
	belongs_to :location
	belongs_to :course
	has_many :users, through: :enrollments
	has_many :homeworks
	has_many :assignments, through: :homeworks
	has_many :enrollments
end