class Enrollment < ActiveRecord::Base
	validates_presence_of :user_id
	validates_presence_of :cohort_id
	belongs_to :user
	belongs_to :cohort
end