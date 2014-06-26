class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :commentable, polymorphic: :true
	validates_presence_of :description
	

	after_create :send_mail

	def send_mail
		email = []
		if self.commentable_type == "Homework"
			user = self.user
			email << self.user.email
			self.commentable.assignment.cohort.users.where(role: "teacher").each do |u|
				email << u.email
				email.each do |e|
					CommentMailer.assignment(e, self)
				end

			end
		else
			self.commentable.cohort.users.each do |e|
				email << e.email
				email.each do |e|
					CommentMailer.assignment(e, self)
				end
			end 
		end

		
	end


end




