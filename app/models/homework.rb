class Homework < ActiverRecord::Base
	belongs_to :user
	belongs_to :assignment
	has_many :comments, as: :commentable
end