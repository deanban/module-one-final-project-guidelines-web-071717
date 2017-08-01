class FilmGenre < ActiveRecord::Base
	belongs_to :genre
	belongs_to :film

end