class HomeworksController < ApplicationController
	
	def new
		@new_homework = Homework.new
	end

	def create
		@new_homework = Homework.new(homework_params)
		if session[:user_id]
			@new_homework.user_id = session[:user_id]
			if @new_homework.save
				redirect_to user_path(session[:user_id])
			else
				render new_homework_path, notice: "you have failed to add this homework"
			end
		else 
			redirect_to login_path, notice: "please log in to submit homework"
		end

	end

	def index
		@homeworks = Homework.all
	end

	def show
		@homework = Homework.find(params[:id])
		if current_user.admin == "teacher"
			@homework.status ="reviewing"
			@homework.save
		end
		
	end

	def edit
		@homework = Homework.find(params[:id])
	end


	def update
 		@homework = Homework.find(params[:id])
 		if @homework.update_attributes(homework_params)
 			redirect_to user_path(current_user.id)
 		else 
 			render edit_homework_path
 		end
 	end

	private

	def homework_params
		params.require(:homework).permit!
	end

end

