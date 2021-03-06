class SessionsController < ApplicationController

 def new
 	
 end

 def create
 	user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
 	if user
 		session[:user_id] = user.id
 		redirect_to user_path(user.id), notice: "logged in"
 	else
 		redirect_to login_path, notice: "Failed to log in "
 	end

 end

 def destroy
 	session[:user_id] = nil
 	redirect_to login_path
 end


end