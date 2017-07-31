class CreateMovies < ActiveRecord::Migration[5.0]
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

  	# 	m = Movies.new
 		# m.director_name = row['director_name'],
  	# 	m.duration = row['duration'],
  	# 	m.actor_1 = row['actor_1'],
   #  	m.genres = row['genres'],
   #    	m.actor_2 = row['actor_2'],
   #    	m.movie_title = row['movie_title'],
   #    	m.num_of_voted_users = row['num_of_voted_users'],
   #    	m.actor_3 = row['actor_3'],
   #    	m.imdb_link = row['imdb_link'],
   #    	m.num_of_reviews = row['num_of_reviews'],
   #    	m.language = row['language'],
   #    	m.country = row['country'],
   #    	m.year = row['year'],
   #    	m.imdb_score = row['imdb_score']
      end

  end
end