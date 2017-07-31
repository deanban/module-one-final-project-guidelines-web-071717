require_relative 'config/environment'
require 'sinatra/activerecord/rake'

require 'csv'

desc 'starts a console'
task :console do
  Pry.start
end



desc "Import IMDB from csv file"
task :import do

  file = "db/movie_data.csv"

  CSV.foreach(file, :headers => true) do |row|
  	#binding.pry

  	Movie.create!({ 
  		director_name: row[0],
  		duration: row[1],
  		actor_1: row[2],
    	genres: row[3],
      	actor_2: row[4],
      	movie_title: row[5],
      	num_of_voted_users: row[6],
      	actor_3: row[7],
      	imdb_link: row[8],
      	num_of_reviews: row[9],
      	language: row[10],
      	country: row[11],
      	year: row[12],
      	imdb_score: row[13]


  	})
    # Movie.create {
    #   director_name: row[1]
    #   Duration: row[2],
    #   Actor_1: row[3],
    #   Genres: row[4],
    #   Actor_2: row[5],
    #   Movie_title: row[6],
    #   Num_of_voted_users: row[7],
    #   Actor_3: row[8],
    #   IMDB_link: row[9],
    #   Num_of_reviews: row[10],
    #   Language: row[11],
    #   Country: row[12],
    #   Year: row[13],
    #   IMDB_score: row[14]
    # }
    puts "row added"
  end

end