FactoryGirl.define do 
	factory(:user) do
		first_name "David"
		last_name "Vandressen"
		email "email@theironyard.com"
		password "qwerty"
		password_confirmation "qwerty"
		admin "teacher"
	end

		factory :student, class: User do
		first_name "Beavis"
		last_name "Butthead"
		email "email@aol.com"
		password "qwerty"
		password_confirmation "qwerty"
		admin "student"

	end



end



