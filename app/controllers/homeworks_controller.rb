class HomeworksController < ApplicationController
	
	def new
		@new_homework = Homework.new
	end

	def create
		@new_homework = Homework.new(homework_params)
		if @new_homework.save
			redirect_to homeworks_path
		else
			render new_homework_path, notice: "you have failed to add this homework"
		end
	end

	def index
		@homeworks = Homework.all
	end

	private

	def homework_params
		params.require(:homework).permit!
	end

end

