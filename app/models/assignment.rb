class Assignment < ActiveRecord::Base
	belongs_to :user
	belongs_to :homework
	has_many :comments, as: :commentable
end