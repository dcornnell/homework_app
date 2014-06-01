class Assignment < ActiveRecord::Base
	belongs_to :cohort
	has_many :homeworks
	has_many :users, through: :homeworks
	has_many :comments, as: :commentable
	belongs_to :cohort
	validates_presence_of :cohort_id



	def collect_emails
		emails = []
		self.homeworks.each do |e|
			emails << e.user.email
			
		end
		return emails
	end

end