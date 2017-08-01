class Film < ActiveRecord::Base
	has_many :film_actors
	has_many :actors, through: :film_actors
	has_many :film_genres
	has_many :genres, through: :film_genres

end

#eof
