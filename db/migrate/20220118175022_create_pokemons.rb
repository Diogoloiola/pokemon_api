class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :evolved
      t.string :url_image
      t.integer :evolution_stage
      t.integer :legendary
      t.integer :aquireable
      t.integer :spawns
      t.integer :regional
      t.integer :raidable
      t.integer :hatchable
      t.integer :shiny
      t.integer :nest
      t.integer :is_new
      t.integer :not_gettable
      t.integer :future_evolve
      t.string :type_one
      t.string :type_two
      t.references :atribute_for_battle, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
