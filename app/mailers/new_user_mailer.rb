class NewUserMailer < ActionMailer::Base
  default from: "dcornnel@gmail.com"

  def send_new_user(user)
  	@user = user
  	mail(to: @user.email, subject: "Thanks for signing up for the Homework App").deliver
  end
end
