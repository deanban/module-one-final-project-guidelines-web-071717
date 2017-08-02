module SearchFunctions	
	def films_by_year
		input = gets.chomp
		@@film = Film.where('year: input')
	
	end

	def films_info
		input = gets.chomp
		@film = Film.find_by(title: input)
		puts "#{@film.title} was released in #{@film.year}."
		puts "#{actor_template(@film)} acted in it."
		puts "#{@film.title} is categorized as #{genre_template(@film)}"
	end

	def actor_info
		input = gets.chomp
		@actor = Actor.find_by(name: input)
		puts "#{@actor.name} starred in #{@actor.films}"
	end

	def genre_info
		input = gets.chomp
		@genre = Genre.find_by(name: input)
		puts "There are #{@genre.films.count} films categorized as #{@genre.name} in our Database."
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
		actor_parser[-1] = "and " + actor_parser[-1]
		actor_parser.join(", ")

	end

	def genre_template(arg)
		genre_parser = arg.genres.map do |genre| 
			genre.name
		end
		genre_parser[-1] = "and " + genre_parser[-1]
		genre_parser.join(", ")
	end



	def films_by_rating
		input = gets.chomp
		puts "****#{Film.find_by(title: input).rating}*****"
	
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