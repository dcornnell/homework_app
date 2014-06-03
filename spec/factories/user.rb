FactoryGirl.define do 
	factory(:user) do
		first_name "David"
		last_name "Vandressen"
		email "email@theironyard.com"
		password "qwerty"
		password_confirmation "qwerty"
		admin "teacher"
	end

end


