require 'rails_helper'
include AuthenticationHelper

feature 'student' do
	let (:student) {FactoryGirl.create(:student)}
	let (:location) {FactoryGirl.create(:location)}
	let (:course) {FactoryGirl.create(:course)}
	let (:cohort) {FactoryGirl.create(:cohort, course_id: course.id, location_id: location.id)}
	let (:assignment) {FactoryGirl.create(:assignment, cohort_id: cohort.id)}
	let (:homework) {FactoryGirl.create(:homework, user_id: student.id, assignment_id: assignment.id)}

	scenario "can post a comment that displays name in a different color label than a teachers" do 
		login(student)
		visit assignment_path(assignment)
		fill_in "comment[description]" , with: "test test test"
		click_button "submit"
		current_path.should eq(assignment_path(assignment))
		page.should have_css('div[class="div label"]')
	end

	scenario "can view a list of submitted assignments on the user page" do
		login(student)
		visit user_path(student)
		page.should have_css('table th' , text: 'Title')
	end

	scenario "can post a comment that displays name in a different color label than a teachers" do 
		login(student)
		visit assignment_path(assignment)
		fill_in "comment[description]" , with: "test test test"
		click_button "submit"
		current_path.should eq(assignment_path(assignment))
		page.should have_css('div[class="div label"]')
	end

	scenario "can post a new homework right from the assignments page" do
		login(student)
		visit assignment_path(assignment)
		fill_in "homework[title]" , with: "test test test"
		click_button "submit!"
		current_path.should eq(user_path(student))
	end

	scenario "cannot add a new assignment" do
		login(student)
		visit new_assignment_path
		current_path.should eq(user_path(student))
		expect(page).to have_content("you do not have permission to access this page")
	end


		



end