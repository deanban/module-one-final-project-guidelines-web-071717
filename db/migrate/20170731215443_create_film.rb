class CreateFilm < ActiveRecord::Migration[5.0]
  def change
  	  create_table :films do |t|
      	t.string :title
      	t.integer :year
      	t.float :rating
    end
  end
end
