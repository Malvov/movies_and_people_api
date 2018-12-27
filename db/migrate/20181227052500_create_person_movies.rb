class CreatePersonMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :person_movies do |t|
      t.references :person, foreign_key: true
      t.references :movie, foreign_key: true
      t.integer :person_role

      t.timestamps
    end
  end
end
