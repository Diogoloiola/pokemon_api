module V1
  class PokemonsController < ApplicationController
    before_action :set_pokemon, only: %i[show update destroy]

    def index
      @pokemons = Pokemon.includes(%i[family atribute_for_batle]).all
    end

    def show; end

    def create
      @pokemon = Pokemon.new(pokemon_params)

      if @pokemon.save
        render :show, status: :created
      else
        render json: @pokemon.errors, status: :unprocessable_entity
      end
    end

    def update
      if @pokemon.update(pokemon_params)
        render :show, status: :ok
      else
        render json: @pokemon.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @pokemon.destroy
    end

    private

    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    def pokemon_params
      params.fetch(:pokemon, {})
    end
  end
end
