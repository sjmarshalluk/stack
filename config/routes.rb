Rails.application.routes.draw do


	#creates a location (url)
	#':story_id' is defined in 'comments_controller.rb' with '@comment.story_id = params[:story_id]'' (segments prefixed with ':' are variable)
	#send that to the ????? with to: 'xxx'
	# get  "/stories/:story_id/comments/new", to: "comments#new"

  resources :stories do
    #specify the only standard conventions we want
    #nested resource - puts '/stories' before in url
    resources :comments, only: [:new, :create, :edit, :update]
    resources :votes, only: [:create, :delete]
  end

  root "stories#index"
end


=begin
 resources keyword gives us standard conventions
  - 
  -
  -
  root defines home
=end