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
			film_count = Film.where("year = #{@rating_year} and rating > #{@rating}").count
			if film_count == 0
				puts "No film found with a rating of #{@rating} in the year #{@rating_year}."
				puts "*********************************************"
			elsif film_count > 0
				puts "#{film_count} movies have a minimum IMDB rating of #{@rating} in the year #{@rating_year}."
				puts "*********************************************"
				list1 = Film.where("year = #{@rating_year} and rating > #{@rating}")
				puts film_template(list1)
				puts "*********************************************"
			end


		elsif rating_year_pref.casecmp('n') == 0

			list = Film.where("rating > #{@rating}")
			puts "*********************************************"

			puts "All these movies have at least a IMDB rating of #{@rating}."
			puts film_template(list)
			puts "*********************************************"
		end


	end

	# def films_by_rating_and_year
	# 	list = Film.where("rating > #{@rating}" AND year: )

	def film_info
		puts "What film do you want to know about?"
		input = gets.chomp

		if Film.find_by("lower(title) = ?", input.downcase)
			@film = Film.find_by("lower(title) = ?", input.downcase)
			puts "*********************************************"
			puts "#{@film.title} was released in #{@film.year}."
			puts "*********************************************"
			puts "Cast includes: \n#{actor_template(@film)}."
			puts "*********************************************"
			puts "#{@film.title} is categorized as \n#{genre_template(@film)}"
			puts "*********************************************"
			puts "#{@film.title} has a IMDB rating of #{@film.rating}."
			puts "*********************************************"

		else
			puts "We couldn't find movies with that name."
			puts "Try again?"
			film_info
		end

	end

	def actor_info
		puts "*********************************************"
		puts "Any specific actor you want to know about?"
		input = gets.chomp
		if Actor.find_by("lower(name) = ?", input.downcase)
			@actor = Actor.find_by("lower(name) = ?", input.downcase)
			puts "*********************************************"
			puts "#{@actor.name} starred in::\n#{film_template(@actor.films)}"
		elsif Actor.find_by("lower(name) = ?", input.downcase) == nil
			puts "We couldn't find anyone with that name."
			puts "Try again?"
			actor_info
		# else
		# 	break if input == 'exit'
		end
		# puts "*********************************************"
		# puts "#{@actor.name} starred in::\n#{film_template(@actor.films)}"
	end

	def genre_info
		puts "Got any genre in mind?"
		input = gets.chomp
		@genre = Genre.find_by("lower(name) = ?",  input.downcase)
		puts "There are #{@genre.films.count} films categorized as #{@genre.name} in our Database."
		puts "*********************************************"
		puts "Would you like to see the titles of these movies?(y/n)"
		input2 = gets.chomp
		if input2.casecmp('y') == 0
			puts "*********************************************"

			puts film_template(@genre.films)
			puts "*********************************************"

		elsif input2.casecmp('n') == 0
			puts "¯\\\_(ツ)_/¯"
		end 	 
	end


	def film_template(arg)
		film_parser = arg.all.map do |film|
			film.title
		end
		template_helper(film_parser)
	end

	def template_helper(listing)
		if listing.count >= 3
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
		template_helper(actor_parser)
	end

	def genre_template(arg)
		genre_parser = arg.genres.map do |genre|
			genre.name
		end
		template_helper(genre_parser)
	end



end
