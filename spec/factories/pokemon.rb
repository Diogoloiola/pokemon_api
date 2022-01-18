FactoryBot.define do
  factory :pokemon do
    name { '' }
    evolved { true }
    url_image { '' }
    evolution_stage { 1 }
    legendary { true }
    aquireable { true }
    spawns { true }
    regional { true }
    raidable { true }
    hatchable { 1 }
    shiny { true }
    nest { true }
    is_new { true }
    not_gettable { true }
    future_evolve { true }
    atribute_for_batle { nil }
    type { nil }
    family { nil }
  end
end
