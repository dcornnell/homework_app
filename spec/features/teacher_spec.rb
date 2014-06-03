require 'rails_helper'
include AuthenticationHelper

feature 'teacher' do
	let (:teacher) {FactoryGirl.create(:user)}
	let (:location) {FactoryGirl.create(:location)}
	let (:course) {FactoryGirl.create(:course)}
	let (:cohort) {FactoryGirl.create(:cohort, course_id: course.id, location_id: location.id)}
	let (:assignment) {FactoryGirl.create(:assignment, cohort_id: cohort.id)}
	let (:homework) {FactoryGirl.create(:homework, user_id: teacher.id, assignment_id: assignment.id)}
	scenario "creating a new location" do
		login(teacher)
		visit "/locations/new"
		fill_in "location[name]" , with: "Xanadu"
		fill_in "location[address]" , with: "Rosebud"
		click_button "add new location"
		current_path.should eq('/locations')
	end
	
	scenario "creating a new course" do	
		login(teacher)
		visit "/courses/new"
		fill_in "course[title]" , with: "rspec"
		fill_in "course[description]" , with: "im so sleepy"
		click_button "Add a new course"
		current_path.should eq('/courses')
	end

	scenario "can add a new assignment right from the cohort page" do
		login(teacher)
		visit cohort_path(cohort)
		expect(page).to have_content("Add an assignment")
	end

	scenario "can view a list of all submitted assignments from the assignmetns page" do
		login(teacher)
		visit assignment_path(assignment)
		expect(page).to have_content("Submissions")
	end

	scenario "can post a comment that displays name in a different color label than a students" do 
		login(teacher)
		visit assignment_path(assignment)
		fill_in "comment[description]" , with: "test test test"
		click_button "submit"
		current_path.should eq(assignment_path(assignment))
		page.should have_css('div[class="div label success"]')
	end

	scenario "can change a student homework status on the homeworks page" do 
		login(teacher)
		visit homework_path(homework)
		print page.html
		page.has_css?('input[class="button-tiny"]', text: 'Update Homework')
	end

end