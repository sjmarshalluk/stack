class VotesController < ApplicationController

	def create
		@vote = Vote.new(story_id: params[:story_id])
		@vote.ip_address = request.ip

		if @vote.save
			flash[:success] = "That worked"
			redirect_to root_path(filter: "popular")
		else
			flash[:error] = "You can't vote again"
			redirect_to root_path(filter: "popular")
		end
	end



end
