class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	#t.(datatype) :(name)
    	t.text :body
    	t.integer :story_id
      	t.timestamps
    end
  end
end
