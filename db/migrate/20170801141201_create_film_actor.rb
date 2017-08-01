class CreateFilmActor < ActiveRecord::Migration[5.0]
  def change
  	create_table :film_actors do |fa|
  		fa.integer :film_id
  		fa.integer :actor_id
  	end
  end
end
