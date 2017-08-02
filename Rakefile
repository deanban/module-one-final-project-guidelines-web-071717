require_relative 'config/environment'
require 'sinatra/activerecord/rake'

require 'csv'



desc 'starts a console'
task :console do
  #ActiveRecord::Base.logger = Logger.new(STDOUT) #from alex
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
    	imdb_link: row[8],      	
      num_of_reviews: row[9],
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
  	film = Film.create!({
  		title: row[5].squish,
  		year: row[12],
  		rating: row[13]
  		})
    actor1 = Actor.find_or_create_by({name: row[2]})
    actor2 = Actor.find_or_create_by({name: row[4]})
    actor3 = Actor.find_or_create_by({name: row[7]})
    # binding.pry
    film.actors << actor1
    film.actors << actor2
    film.actors << actor3

    genres = row[3].split("|")
    genres.each do |genre| 
      set_genre = Genre.find_or_create_by({name: genre})
      film.genres << set_genre
    end

    film.save
    puts "row added"
  end

end
#07/30/2017



desc "Import filmID & actorID from film and actor table"
task :import_film_actor do

  file = "db/movie_data.csv"

  CSV.foreach(file, :headers => true) do |row|
    Film_actor.create!({
      title: row[5],
      year: row[12],
      rating: row[13]
      })
    puts "row added"
  end

end

