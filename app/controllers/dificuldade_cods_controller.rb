class DificuldadeCodsController < ApplicationController
  before_action :set_dificuldade_cod, only: [:show, :update, :destroy]

  # GET /dificuldade_cods
  def index
    @dificuldade_cods = DificuldadeCod.all

    render json: @dificuldade_cods
  end

  # GET /dificuldade_cods/1
  def show
    render json: @dificuldade_cod
  end

  # POST /dificuldade_cods
  def create
    @dificuldade_cod = DificuldadeCod.new(dificuldade_cod_params)

    if @dificuldade_cod.save
      render json: @dificuldade_cod, status: :created, location: @dificuldade_cod
    else
      render json: @dificuldade_cod.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dificuldade_cods/1
  def update
    if @dificuldade_cod.update(dificuldade_cod_params)
      render json: @dificuldade_cod
    else
      render json: @dificuldade_cod.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dificuldade_cods/1
  def destroy
    @dificuldade_cod.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dificuldade_cod
      @dificuldade_cod = DificuldadeCod.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dificuldade_cod_params
      params.require(:dificuldade_cod).permit(:nome)
    end
end
