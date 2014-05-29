class UsersController < ApplicationController
 
 def index
 	@users = User.all
 end

 def new
 	@new_user = User.new
 end

 def create
 	@new_user = User.new(user_params)
 	my_string = @new_user.email
	if my_string.include? "@theironyard.com"
   	@new_user.admin = "teacher"
	end
 	if @new_user.save
 		redirect_to users_path
 	else
 		render new_user_path, notice: "you have failed to sign up"
 	end
 end

 	


 private

 def user_params
 	params.require(:user).permit!
 end
end
