class Homework < ActiverRecord::Base
	belongs_to :user
	has_many :assignments
	has_many :comments, as: :commentable
end