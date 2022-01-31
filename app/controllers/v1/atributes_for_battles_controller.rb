module V1
  class AtributesForBattlesController < ApplicationController
    before_action :set_atributes_for_battle, only: %i[show update destroy]

    def index
      @atributes_for_battles = AtributeForBattle.all
    end

    def show; end

    def create
      @atributes_for_battle = AtributeForBattle.new(atributes_for_battle_params)

      if @atributes_for_battle.save
        render :show, status: :created
      else
        render json: @atributes_for_battle.errors, status: :unprocessable_entity
      end
    end

    def update
      if @atributes_for_battle.update(atributes_for_battle_params)
        render :show, status: :ok
      else
        render json: @atributes_for_battle.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @atributes_for_battle.destroy
    end

    private

    def set_atributes_for_battle
      @atributes_for_battle = AtributeForBattle.find(params[:id])
    end

    def atributes_for_battle_params
      params.require(:atributes_for_battle).permit(:atack, :stamina, :defense, :total_stamina, :cp_max, :hp_max)
    end
  end
end
