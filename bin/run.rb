require_relative '../config/environment'
ActiveRecord::Base.logger = nil 

class MovieSearcher
	include SearchFunctions

	attr_accessor :film, :actor, :genre, :rating, :year1, :year2

	def welcome
		puts "What are you interested in?"
		#puts "If you are interested in 10,000 B.C. Go F yourself!"
		puts "You can type: Films, Actors, Year, Genre, or Ratings"
	end

	def input_checker()
		input = gets.chomp

		if input.casecmp('films') == 0
			puts "What film do you want to know about?"
			films_info
		elsif input.casecmp('actors') == 0
			puts "Any specific actor you want to know about?"
			actor_info
		elsif input.casecmp('genre') == 0
			puts "Got any genre in mind?"
			genre_info
		elsif input.casecmp('year') == 0
			puts "Do you want to checkout a range of years, or a specific one?"
			preference = gets.chomp
			if preference == 'Range'
				puts "Put in the starting year"
				@year1 = gets.chomp
				puts "Put in the ending year"
				@year2 = gets.chomp
				films_by_year_range
			elsif preference == 'Specific'
				films_by_year
			end
		elsif input.casecmp('exit') == 0
			gtfo
		else
			puts "Pick an actual option!"
			input_checker
		end

	end

	def runner
		welcome
		input_checker
	end

	def gtfo
		puts "GTFO"
	end
end



MovieSearcher.new.runner
# puts MovieSearcher.new.input_checker(input)

#Get all the searcher functions set up
#store vals as instance varaiable
#get nested serchers setup
#have a way to redo the search
