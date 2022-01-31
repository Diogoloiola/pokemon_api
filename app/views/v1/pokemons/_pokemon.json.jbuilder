json.extract! pokemon, :id, :name, :evolved, :url_image, :evolution_stage, :legendary, :aquireable, :spawns, :regional,
              :raidable, :hatchable, :shiny, :nest, :is_new, :not_gettable, :future_evolve, :type_one, :type_two

json.family do
  json.cross_gen pokemon.family.cross_gen
  json.generation pokemon.family.generation
end
json.atributes_for_battle do
  json.atack pokemon.atribute_for_battle.atack
  json.stamina pokemon.atribute_for_battle.stamina
  json.total_stamina pokemon.atribute_for_battle.total_stamina
  json.defense pokemon.atribute_for_battle.defense
  json.atack pokemon.atribute_for_battle.atack
  json.cp_max pokemon.atribute_for_battle.cp_max
  json.hp_max pokemon.atribute_for_battle.hp_max
end
