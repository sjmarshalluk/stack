class AddUrlToStories < ActiveRecord::Migration
  def change
  	#add column to the stories table, to accept a url
  	add_column :stories, :url, :string
  end
end
