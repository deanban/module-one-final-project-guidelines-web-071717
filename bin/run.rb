require_relative '../config/environment'



class MovieSearcher
	include SearchFunctions

	attr_accessor :film, :actor, :genre, :rating
	
	def welcome
		puts "What are you interested in?"
		#puts "If you are interested in 10,000 B.C. Go F yourself!"
		puts "You can type: Films, Actors, Year, Genre, or Ratings"
	end

	def input_checker()
		input = gets.chomp

		case input 
			when "Films"
				puts "What film do you want to know about?"
				films_info
				
			when "Actors"
				puts "Any specific actor you want to know about?"
				actor_info

			when "Genre"
				puts "Got any genre in mind?"
				genre_info

			# # when "Year" 
			# # 	puts "Do you want to checkout a range of years, or a specific one?"
			# # 	when 'Range'
			# # 		#do this
			# # 	else
			# # 		films_by_year




			# 	puts "Which year are you interested in?"
			# 	films_by_year

				

			when 'exit'
				gtfo	

			else
				puts "Pick an actual option!"
				input_checker
			end
		# elsif input == "rating"
			#actor_searcher
		#  elsif input == "Year"
		# 	films_by_year
		# elsif input == "actors"
		# 	Actor.where(name: "input")

	end


	# def display_films(films)

	# end
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

