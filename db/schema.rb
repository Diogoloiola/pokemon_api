# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_18_175022) do

  create_table "atribute_for_batles", force: :cascade do |t|
    t.integer "atack"
    t.integer "stamina"
    t.integer "defense"
    t.integer "total_stamina"
    t.integer "cp_max"
    t.integer "hp_max"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "families", force: :cascade do |t|
    t.integer "generation"
    t.boolean "cross_gen"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.boolean "evolved"
    t.string "url_image"
    t.integer "evolution_stage"
    t.boolean "legendary"
    t.boolean "aquireable"
    t.boolean "spawns"
    t.boolean "regional"
    t.boolean "raidable"
    t.integer "hatchable"
    t.boolean "shiny"
    t.boolean "nest"
    t.boolean "is_new"
    t.boolean "not_gettable"
    t.boolean "future_evolve"
    t.integer "atribute_for_batle_id", null: false
    t.integer "type_id", null: false
    t.integer "family_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["atribute_for_batle_id"], name: "index_pokemons_on_atribute_for_batle_id"
    t.index ["family_id"], name: "index_pokemons_on_family_id"
    t.index ["type_id"], name: "index_pokemons_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "one"
    t.string "two"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pokemons", "atribute_for_batles"
  add_foreign_key "pokemons", "families"
  add_foreign_key "pokemons", "types"
end
