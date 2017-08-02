module SearchFunctions
	def films_by_year
		puts "Pick a year"
		@year1 = gets.chomp
		list = Film.where(year: @year1)
		puts "These movies were released in the year #{@year1}:"
		puts film_template(list)

	end

	def films_by_year_range
		#range = "#{@year1}...#{@year2}"
		list = Film.where(year: @year1...@year2)
		puts "From #{@year1} to #{@year2} these movies were released:"
		puts film_template(list)
	end

	def films_info
		input = gets.chomp
		@film = Film.find_by("lower(title) = ?", input.downcase)
		puts "#{@film.title} was released in #{@film.year}."
		puts "Cast includes: #{actor_template(@film)}."
		puts "#{@film.title} is categorized as #{genre_template(@film)}"
		puts "#{@film.title} has a IMDB rating of #{@film.rating}."
	end

	def actor_info
		input = gets.chomp
		@actor = Actor.find_by("lower(name) = ?", input.downcase)
		puts "#{@actor.name} starred in::\n#{film_template(@actor.films)}"
	end

	def genre_info
		input = gets.chomp
		@genre = Genre.find_by("lower(name) = ?",  input.downcase)
		puts "There are #{@genre.films.count} films categorized as #{@genre.name} in our Database."

	end

	def film_template(arg)
		film_parser = arg.all.map do |film|
			film.title
		end
		#fixe these up, sometimes there are less than 3 films
		if film_parser.count > 3
			film_parser[-1] = "and " + film_parser[-1]
			film_parser.join(", \n")
		elsif film_parser.count == 2
			film_parser = "#{film_parser[0]} and #{film_parser[1]}."
		elsif film_parser.count == 1
			film_parser.join
		end
	end

	# def rating_info
	# # 	input = gets.chomp
	# # 	@rating = Film.find_by('rating = ')
	# # 	puts "There are #{@genre.films.count} films categorized as #{@genre.name} in our Database."
	# # end

	def actor_template(arg)
		actor_parser = arg.actors.map do |actor|
			actor.name
		end
		#fixe these up, sometimes there are less than 3 actors
		actor_parser[-1] = "and " + actor_parser[-1]
		actor_parser.join(", ")

	end

	def genre_template(arg)
		genre_parser = arg.genres.map do |genre|
			genre.name
		end
		#look at actors.
		genre_parser[-1] = "and " + genre_parser[-1]
		genre_parser.join(", ")
	end



	def films_by_min_rating
		@rating = gets.chomp
		@rating = @rating.to_f
		list = Film.where("rating > #{@rating}")
		puts "All these movies have at least a rating of #{@rating}."
		puts film_template(list)

	end

	def films_by_actor
		input = gets.chomp
		#puts "****#{Actor.find_by(name: input)}*****"

	end

	def films_by_genre
		input = gets.chomp
		#puts "****#{Genre.find_by(title: input)}*****"

	end

end
