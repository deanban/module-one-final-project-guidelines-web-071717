class CreateFilm < ActiveRecord::Migration[5.0]
  def change
  	  create_table :films do |f|
      	f.string :title
      	f.integer :year
      	f.float :rating
    end
  end
end
