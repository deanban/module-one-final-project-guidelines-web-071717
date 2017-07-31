
class CreateMoviedb < ActiveRecord::Migration[5.0]
  def change
  	create_table :movies do |m|
  		m.string :director_name
  		m.integer :duration
  		m.string :actor_1
  		m.string :genres
  		m.string :actor_2
  		m.string :movie_title
  		m.integer :num_of_voted_users
  		m.string :actor_3
  		m.string :imdb_link
  		m.integer :num_of_reviews
  		m.string :language
  		m.string :country
  		m.integer :year
  		m.decimal :imdb_score
  	end
  end
end
