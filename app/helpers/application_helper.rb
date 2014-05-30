module ApplicationHelper


	def show_name(name)
		user = User.find(name)
		full_name = "#{user.first_name} #{user.last_name}" 
	end		
end
