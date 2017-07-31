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
  	Movie.create!({
  		director_name: row[0],
  		duration: row[1],
  		actor_1: row[2],
    	genres: row[3],
      actor_2: row[4],
      movie_title: row[5],
    	num_of_voted_users: row[6],
    	actor_3: row[7],
    	imdb_link: row[8],      	num_of_reviews: row[9],
      language: row[10],
    	country: row[11],
    	year: row[12],
    	imdb_score: row[13]
  	})
    puts "row added"
  end

end

desc "Import only actors from IMDB from csv file"
task :import_actors do

  file = "db/movie_data.csv"

  CSV.foreach(file, :headers => true) do |row|
  	Actor.create!({name: row[2]}) unless Actor.find_by(name: row[2])
    Actor.create!({name: row[4]}) unless Actor.find_by(name: row[4])
    Actor.create!({name: row[7]}) unless Actor.find_by(name: row[7])
    puts "row added"
  end

end

desc "Import title, year, and rating from IMDB from csv file"
task :import_film do

  file = "db/movie_data.csv"

  CSV.foreach(file, :headers => true) do |row|
  	Film.create!({
  		title: row[5],
  		year: row[12],
  		rating: row[13]
  		})
    puts "row added"
  end

end
