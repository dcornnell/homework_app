class Course < ActiveRecord::Base
	has_many :cohorts
	validates_uniqueness_of :title
end