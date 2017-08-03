require_relative '../config/environment'
ActiveRecord::Base.logger = nil

class MovieSearcher
	include SearchFunctions

	attr_accessor :film, :actor, :genre, :rating, :year1, :year2, :rating_year

	def welcome
		puts "
██╗███╗   ███╗██████╗ ██████╗      ██████╗██╗      ██████╗ ███╗   ██╗███████╗
██║████╗ ████║██╔══██╗██╔══██╗    ██╔════╝██║     ██╔═══██╗████╗  ██║██╔════╝
██║██╔████╔██║██║  ██║██████╔╝    ██║     ██║     ██║   ██║██╔██╗ ██║█████╗
██║██║╚██╔╝██║██║  ██║██╔══██╗    ██║     ██║     ██║   ██║██║╚██╗██║██╔══╝
██║██║ ╚═╝ ██║██████╔╝██████╔╝    ╚██████╗███████╗╚██████╔╝██║ ╚████║███████╗
╚═╝╚═╝     ╚═╝╚═════╝ ╚═════╝      ╚═════╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

"
		puts "WAS IMDB DOWN?"
		puts "We've got you covered."
		#puts "Not affiliated with the Real IMDB"
		puts "What are you interested in?"
		#puts "If you are interested in 10,000 B.C, get a life!"
	end

	def input_checker
		puts "You can type: Films, Actors, Year, Genre, or Ratings"
		input = gets.chomp

		if input.casecmp('films') == 0
			#puts "What film do you want to know about?"
			film_info
		elsif input.casecmp('actors') == 0
			actor_info
			puts "*********************************************"

			puts "Are you interested in any of #{@actor.name}'s movies?"
			puts "Y/N?"
			sub_input = gets.chomp
			puts "*********************************************"

			if sub_input.casecmp('Y') == 0
				film_info
			elsif sub_input.casecmp('N') == 0

			end
		elsif input.casecmp('genre') == 0
			genre_info
		elsif input.casecmp('year') == 0
			puts "Do you want to checkout a range of years, or a specific one?"
			preference = gets.chomp
			if preference.casecmp("Range") == 0
				puts "Put in the starting year"
				@year1 = gets.chomp
				puts "Put in the ending year"
				@year2 = gets.chomp
				films_by_year_range
			elsif preference.casecmp("Specific") == 0
				films_by_year
			end
		elsif input.casecmp('ratings') == 0
			puts "What's your lowest expectation?"
			films_by_min_rating
				#puts "Movies with a minimum rating of #{}"

		elsif input.casecmp('exit') == 0
			gtfo
			#'exit'
		else
			puts "Pick an actual option!"
			input_checker
		end

	end

	def runner
		welcome
		until input_checker == 'exit'
			input_checker
		end
	end

	def gtfo
		puts "
████████╗██╗  ██╗ █████╗ ████████╗███████╗     █████╗ ██╗     ██╗         ███████╗ ██████╗ ██╗     ██╗  ██╗███████╗██╗
╚══██╔══╝██║  ██║██╔══██╗╚══██╔══╝██╔════╝    ██╔══██╗██║     ██║         ██╔════╝██╔═══██╗██║     ██║ ██╔╝██╔════╝██║
   ██║   ███████║███████║   ██║   ███████╗    ███████║██║     ██║         █████╗  ██║   ██║██║     █████╔╝ ███████╗██║
   ██║   ██╔══██║██╔══██║   ██║   ╚════██║    ██╔══██║██║     ██║         ██╔══╝  ██║   ██║██║     ██╔═██╗ ╚════██║╚═╝
   ██║   ██║  ██║██║  ██║   ██║   ███████║    ██║  ██║███████╗███████╗    ██║     ╚██████╔╝███████╗██║  ██╗███████║██╗
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝      ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝
                                                                                                                      
"
		return exit 

	end
end



MovieSearcher.new.runner
# puts MovieSearcher.new.input_checker(input)

#Get all the searcher functions set up
#store vals as instance varaiable
#get nested serchers setup
#have a way to redo the search
