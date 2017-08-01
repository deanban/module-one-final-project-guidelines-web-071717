class CreateFilmGenre < ActiveRecord::Migration[5.0]
  def change
  	create_table :film_genres do |fg|
  		fg.integer :film_id
  		fg.integer :genre_id
  	end
  end
end
