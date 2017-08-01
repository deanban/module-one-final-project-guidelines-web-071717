class Film < ActiveRecord::Base
	has_many :film_actors
	has_many :actors, through: :film_actors

end

#eof
