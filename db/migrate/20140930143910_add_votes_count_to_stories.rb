class AddVotesCountToStories < ActiveRecord::Migration
  def change
  	# Add, to this table, this column name, with this datatype
  	add_column :stories, :votes_count, :integer, default: 0
  end
end
