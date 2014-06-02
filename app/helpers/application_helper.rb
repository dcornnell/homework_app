module ApplicationHelper


	def show_name(name)
		user = User.find(name)
		full_name = "#{user.first_name} #{user.last_name}" 
	end		


	def formatted_date(date)
		date.strftime("%B %-d, %Y")
	end
end
