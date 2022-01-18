class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.boolean :evolved
      t.string :url_image
      t.integer :evolution_stage
      t.boolean :legendary
      t.boolean :aquireable
      t.boolean :spawns
      t.boolean :regional
      t.boolean :raidable
      t.integer :hatchable
      t.boolean :shiny
      t.boolean :nest
      t.boolean :is_new
      t.boolean :not_gettable
      t.boolean :future_evolve
      t.references :atribute_for_batle, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
