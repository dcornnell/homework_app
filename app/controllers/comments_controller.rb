class CommentsController <ApplicationController
		load_and_authorize_resource param_method: :comments_params
		def new
		@new_comment = Comment.new
	end

	def create
		@new_comment = Comment.new(comment_params)
		
		if @new_comment.save
	
			
			if @new_comment.commentable_type == "Homework"
				CommentMailer.homework(params[:receiver], @new_comment)
			else 
		
				@assignment = Assignment.find(params[:receiver])
				@emails = @assignment.collect_emails
				@emails.each do |e|
					CommentMailer.assignment(e, @new_comment, @assignment)
				end
				
			end
			redirect_to :back
		else
			redirect_to photo_path
		end
	end




private

 def comment_params
 	params.require(:comment).permit!
 end
end
