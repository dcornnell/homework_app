class CommentMailer < ActionMailer::Base
  default from: "dcornnel@gmail.com"


   def homework(receiver, comment)
  	@comment = comment
  	@receiver = receiver
  	mail(to: @receiver, subject: "Your homework has been commented on").deliver
  end

  def assignment(receiver, comment, assignment)
    @comment = comment
    @receiver = receiver
    @assignment = assignment
    mail(to: @receiver, subject: "a comment has been added to an assigment").deliver
  end


end


