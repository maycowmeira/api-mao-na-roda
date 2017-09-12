class DificuldadesController < ApplicationController
  before_action :set_dificuldade, only: [:show, :update, :destroy]

  # GET /dificuldades
  def index
    @dificuldades = Dificuldade.all

    render json: @dificuldades
  end

  # GET /dificuldades/1
  def show
    render json: @dificuldade
  end

  # POST /dificuldades
  def create
    @dificuldade = Dificuldade.new(dificuldade_params)

    if @dificuldade.save
      render json: @dificuldade, status: :created, location: @dificuldade
    else
      render json: @dificuldade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dificuldades/1
  def update
    if @dificuldade.update(dificuldade_params)
      render json: @dificuldade
    else
      render json: @dificuldade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dificuldades/1
  def destroy
    @dificuldade.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dificuldade
      @dificuldade = Dificuldade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dificuldade_params
      params.require(:dificuldade).permit(:valor, :usuario_id, :dificuldade_cod_id)
    end
end
