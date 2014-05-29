class EnrollmentsController < ApplicationController
	def new
		@new_enrollment = Enrollment.new
	end

	def create 
		@new_enrollment = Enrollment.new(enrollment_params)
		if session[:user_id] 
			@new_enrollment.user_id = session[:user_id]
			if @new_enrollment.save
				redirect_to cohorts_path
			else
				redirect_to :back
			end
		else
			redirect_to login_path
		end
	end

	private

	def enrollment_params
		params.require(:enrollment).permit!
	end
end
