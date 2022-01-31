module V1
  class PokemonsController < ApplicationController
    before_action :set_pokemon, only: %i[show update destroy]

    def index
      page = params[:page] ? params[:page].to_i : 0
      per_page = params[:per_page] ? params[:per_page].to_i : 50

      @pokemons = Pokemon.includes(%i[family atribute_for_battle]).offset(page * per_page).limit(per_page)
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

    def family
      @pokemons = Pokemon.where(family_id: params[:id])
      render :index
    end

    private

    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    def pokemon_params
      params.require(:pokemon).permit(:name, :evolved, :url_image, :evolution_stage, :legendary, :aquireable, :spawns,
                                      :regional, :raidable, :hatchable, :shiny, :nest, :is_new, :not_gettable,
                                      :future_evolve, :type_one, :type_two, :atribute_for_battle_id, :family_id)
    end
  end
end
