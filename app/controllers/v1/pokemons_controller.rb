module V1
  class PokemonsController < ApplicationController
    before_action :set_v1_pokemon, only: %i[show update destroy]

    def index
      @v1_pokemons = Pokemon.all
    end

    def show; end

    # POST /v1/pokemons
    # POST /v1/pokemons.json
    def create
      @v1_pokemon = Pokemon.new(v1_pokemon_params)

      if @v1_pokemon.save
        render :show, status: :created, location: @v1_pokemon
      else
        render json: @v1_pokemon.errors, status: :unprocessable_entity
      end
    end

    def update
      if @v1_pokemon.update(v1_pokemon_params)
        render :show, status: :ok, location: @v1_pokemon
      else
        render json: @v1_pokemon.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @v1_pokemon.destroy
    end

    private

    def set_v1_pokemon
      @v1_pokemon = Pokemon.find(params[:id])
    end

    def v1_pokemon_params
      params.fetch(:v1_pokemon, {})
    end
  end
end
