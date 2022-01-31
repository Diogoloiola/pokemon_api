module V1
  class FamiliesController < ApplicationController
    before_action :set_family, only: %i[show update destroy]

    def index
      @families = Family.all
    end

    def show; end

    def create
      @family = Family.new(family_params)

      if @family.save
        render :show, status: :created
      else
        render json: @family.errors, status: :unprocessable_entity
      end
    end

    def update
      if @family.update(family_params)
        render :show, status: :ok
      else
        render json: @family.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @family.destroy
    end

    private

    def set_family
      @family = Family.find(params[:id])
    end

    def family_params
      params.require(:family).permit(:cross_gen, :generation)
    end
  end
end
