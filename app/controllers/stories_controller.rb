class StoriesController < ApplicationController
	

#Shows all posts

	def index
		if params[:sort] == "recent"	
			#http://guides.rubyonrails.org/active_record_querying.html#ordering - ordering the results
			@stories = Story.order(created_at: :desc)
		elsif params[:filter] == "popular"
			@stories = Story.order(votes_count: :desc)
		elsif params[:filter] == "featured"
			@stories = Story.where(is_featured: true)
		else
			@stories = Story.order(created_at: :asc)
		end
	end



#Shows single post

	def show
		@story = Story.find(params[:id])
		@comments = @story.comments
	end



#allows to create new

	def new
		@story = Story.new
	end



# recieves data for new post

	def create
		@story = Story.new(story_params)
		if @story.save
			flash[:success] = "That worked"
			redirect_to root_path
		else
			flash[:error] = "That didnt work"
			render :new
		end
	end



# allows to edit post

	def edit
		@story = Story.find(params[:id])
	end	



# recieves data for edited post

	def update
		@story = Story.find(params[:id])

		if @story.update(story_params)
			flash[:success] = "That worked"
			redirect_to story_path(@story)
		else
			flash[:error] = "That didnt work"
			render :new
		end

	end



# allows to delete post

	def destroy
		@story = Story.find(params[:id])
		@story.delete
		flash[:success] = "Deleted"
		redirect_to root_path
	end



#to only accept allowed data from story_params in create and update. need to add each item here.

	private
	def story_params
		# Only the data I whitelist is allowed through
		params.require(:story).permit(:title, :body, :url, :is_featured)
	end
	
end
