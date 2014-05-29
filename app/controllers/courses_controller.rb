class CoursesController < ApplicationController
	load_and_authorize_resource param_method: :courses_params
	def new
		@new_course = Course.new
	end

	def create
		@new_course = Course.new(course_params)
		if @new_course.save
			redirect_to courses_path
		else
			render new_course_path, notice: "you have failed to add this course"
		end
	end

	def index 
		@courses = Course.all
	end

	private

	def course_params
		params.require(:course).permit!
	end


end
