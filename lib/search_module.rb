module SearchFunctions
	def films_by_year
		puts "Pick a year"
		@year1 = gets.chomp
		list = Film.where(year: @year1)
		puts "*********************************************"

		puts "These movies were released in the year #{@year1}:"
		puts film_template(list)
		puts "*********************************************"


	end

	def films_by_year_range
		#range = "#{@year1}...#{@year2}"
		list = Film.where(year: @year1...@year2)
		puts "*********************************************"

		puts "From #{@year1} to #{@year2} these movies were released:"
		puts film_template(list)
		puts "*********************************************"

	end

	def films_by_min_rating
		@rating = gets.chomp
		@rating = @rating.to_f
		puts "Do you have a year in mind? y/n"
		rating_year_pref = gets.chomp
		if rating_year_pref.casecmp('y') == 0
			puts "Enter year"
			@rating_year = gets.chomp
			puts "*********************************************"
			puts "These movies have a minimum rating of #{@rating} in the year #{@rating_year}."
			list = Film.where("year = #{@rating_year} and rating > #{@rating}")
			film_template(list)
			puts "*********************************************"


		elsif rating_year_pref.casecmp('n') == 0
				
			list = Film.where("rating > #{@rating}")
			puts "*********************************************"

			puts "All these movies have at least a rating of #{@rating}."
			puts film_template(list)
			puts "*********************************************"
		end


	end

	# def films_by_rating_and_year
	# 	list = Film.where("rating > #{@rating}" AND year: )

	def film_info
		puts "What film do you want to know about?"
		input = gets.chomp
		@film = Film.find_by("lower(title) = ?", input.downcase)
		puts "*********************************************"
		puts "#{@film.title} was released in #{@film.year}."
		puts "*********************************************"
		puts "Cast includes: #{actor_template(@film)}."
		puts "*********************************************"
		puts "#{@film.title} is categorized as #{genre_template(@film)}"
		puts "*********************************************"
		puts "#{@film.title} has a IMDB rating of #{@film.rating}."
		puts "*********************************************"

	end

	def actor_info
		input = gets.chomp
		if Actor.find_by("lower(name) = ?", input.downcase)		
			@actor = Actor.find_by("lower(name) = ?", input.downcase)
		elsif Actor.find_by("lower(name) = ?", input.downcase) == nil
			puts "We couldn't find anyone with that name."
			puts "Try again?"
			actor_info
		# else 
		# 	break if input == 'exit'	
		end
		puts "*********************************************"
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
		template_helper(film_parser)
	end

	def template_helper(listing)
		if listing.count > 3
			listing[-1] = "and " + listing[-1]
			listing.join(", \n")
		elsif listing.count == 2
			listing = "#{listing[0]} and #{listing[1]}."
		elsif listing.count == 1
			listing.join
		end
	end

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



end
