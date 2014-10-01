class CommentsController < ApplicationController
  def new

  	# This is for the form
  	@story = Story.find(params[:story_id]) # This comes from the URL

  	# Also for building the form
  	@comment = Comment.new
  	
  	# We no longer need ro explicity set the story_id
  	# The form is being built from @story
  	# This outs the story id in the input field. We dont want that so the user cant edit
  	# @comment.story_id = params[:story_id]

  end

	def create
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new(comment_params)

		if @comment.save
			flash[:success] = "That worked"
			redirect_to story_path(@story)
		else
			flash.now[:error] = "That didnt work"
			render :new
		end
	end

  def edit
  	@comment = Comment.find[:id]
  end

  private
	def comment_params
		# Only the data I whitelist is allowed through
		params.require(:comment).permit(:body, :story_id)
	end
end
