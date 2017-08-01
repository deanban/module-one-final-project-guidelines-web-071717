class CreateGenre < ActiveRecord::Migration[5.0]
  def change
  	create_table :genres do |g|
  		g.string :name
  	end
  end
end
