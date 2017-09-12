class ProblemasController < ApplicationController
  before_action :set_problema, only: [:show, :update, :destroy]

  # GET /problemas
  def index
    @problemas = Problema.all

    render json: @problemas
  end

  # GET /problemas/1
  def show
    render json: @problema
  end

  # POST /problemas
  def create
    @problema = Problema.new(problema_params)

    if @problema.save
      render json: @problema, status: :created, location: @problema
    else
      render json: @problema.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /problemas/1
  def update
    if @problema.update(problema_params)
      render json: @problema
    else
      render json: @problema.errors, status: :unprocessable_entity
    end
  end

  # DELETE /problemas/1
  def destroy
    @problema.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problema
      @problema = Problema.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def problema_params
      params.require(:problema).permit(:coordenadas, :descricao, :usuario_id, :tipo_marcacao_id, :solucao_id)
    end
end
