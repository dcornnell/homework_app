class Assignment < ActiveRecord::Base
	belongs_to :cohort
	has_many :homeworks
	has_many :comments, as: :commentable
	belongs_to :cohort
	validates_presence_of :cohort_id
end