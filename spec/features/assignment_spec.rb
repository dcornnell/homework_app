require 'rails_helper'
include AuthenticationHelper

feature 'Assignments' do
	let (:user) { FactoryGirl.create(:user) }
	let (:student) { FactoryGirl.create(:student) }
	let (:cohort) { FactoryGirl.create(:cohort) }
	let (:assignment) { FactoryGirl.create(:assignment, cohort_id: cohort.id) }

	scenario "User views assignments page" do
		login(user)
		visit assignments_path
		current_path.should eq assignments_path
	end

	scenario "Teacher creates an assignment" do
		login(user)
		visit new_assignment_path

		fill_in 'assignment[name]', with: "Dan is the man with a plan"
		fill_in 'assignment[description]', with: 'Dan ran for ambassador of Japan, just to stick it to the man.'
		click_button 'Add an assignment'
		current_path.should eq new_assignment_path
	end

	scenario "Student tries to create an assignment" do
		login(student)
		visit new_assignment_path

		current_path.should eq user_path(student)
		page.has_content?('you do not have permission to access this page')
	end

	# scenario "Teacher views edit page" do
	# 	login(user)
	# 	visit edit_assignment_path(assignment)
	# 	current_path.should eq edit_assignment_path(assignment)
	# end
	
	# scenario "Teacher edits an assignment" do
	# 	login(user)
	# 	visit edit_assignment_path(assignment)

	# 	fill_in 'assignment[name]', with: "Dan got tan while visiting Iran."
	# 	fill_in 'assignment[description]', with: 'As the leading man in Japan, Dan banned Stan from using the can.'
	# 	click_button 'Add an assignment'

	# 	current_path.should eq assignments_path
	# 	page.has_content?('Iran')
	# end

end

	
	