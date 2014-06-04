class CommentMailer < ActionMailer::Base
  default from: "dcornnel@gmail.com"


   def homework(email, comment)
  	@comment = comment
  	
  	mail(to: @email, subject: "a homework has been commented on").deliver
  end

  def assignment(email, comment)
    @comment = comment
  
    @email = email
    mail(to: @email, subject: "a comment has been added to an assigment").deliver
  end


end


