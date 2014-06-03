module AuthenticationHelper
	def login(user)
		visit '/login'
		fill_in 'email' , with: user.email
		fill_in 'password' , with: user.password
		click_button "commit"
	end
	
	def current_user(user)
		current_user = user
	end
end
