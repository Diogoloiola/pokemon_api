xlsx = Roo::Spreadsheet.open('db/support/data.xlsx')

headers = {
  name: 'Name',
  pokedex_number: 'Pokedex Number',
  img_name: 'Img name',
  generation: 'Generation',
  evolution_stage: 'Evolution Stage',
  evolved: 'Evolved',
  family_id: 'FamilyID',
  cross_gen: 'Cross Gen',
  type_one: 'Type 1',
  type_two: 'Type 2',
  weather_one: 'Weather 1',
  weather_two: 'Weather 2',
  stat_total: 'STAT TOTAL',
  atack: 'ATK',
  defense: 'DEF',
  stamina: 'STA',
  legendary: 'Legendary',
  aquireable: 'Aquireable',
  spawns: 'Spawns',
  regional: 'Regional',
  raidable: 'Raidable',
  hatchable: 'Hatchable',
  shiny: 'Shiny',
  nest: 'Nest',
  is_new: 'New',
  not_gettable: 'Not-Gettable',
  future_evolve: 'Future Evolve',
  cp: '100% CP @ 40',
  hp: '100% CP @ 39'
}

pokemons = xlsx.parse(headers)

Pokemon.destroy_all
Family.destroy_all
AtributeForBattle.destroy_all

pokemons.each do |pokemon|
  family = Family.where(id: pokemon['family_id'])

  if family.empty?
    family = Family.create!(cross_gen: pokemon[:cross_gen],
                            generation: pokemon[:generation])
  end
  atributes_for_battle = AtributeForBattle.create!(atack: pokemon[:atack], stamina: pokemon[:stamina],
                                                   defense: pokemon[:defense], total_stamina: pokemon[:stat_total],
                                                   cp_max: pokemon[:cp], hp_max: pokemon[:hp])

  Pokemon.create!(name: pokemon[:name], evolved: pokemon[:evolved], url_image: pokemon[:url_image],
                  evolution_stage: pokemon[:evolution_stage], legendary: pokemon[:legendary],
                  aquireable: pokemon[:aquireable], spawns: pokemon[:spawns], regional: pokemon[:regional],
                  raidable: pokemon[:raidable], hatchable: pokemon[:hatchable], shiny: pokemon[:shiny],
                  nest: pokemon[:nest], is_new: pokemon[:is_new], not_gettable: pokemon[:not_gettable],
                  future_evolve: pokemon[:future_evolve], type_one: pokemon[:type_one], type_two: pokemon[:type_two],
                  atribute_for_battle_id: atributes_for_battle.id, family_id: family.id)
end
