class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :email
	validates_uniqueness_of :email
	has_many :enrollments
	has_many :cohorts, through: :enrollments
	has_many :homeworks
	has_many :assignments
	has_many :comments
	after_create :send_new_user
	

	def send_new_user
		NewUserMailer.send_new_user(self)
	end

	def make_admin
		self.admin == "teacher"
	end
end