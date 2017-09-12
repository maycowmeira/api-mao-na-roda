class SolucaosController < ApplicationController
  before_action :set_solucao, only: [:show, :update, :destroy]

  # GET /solucaos
  def index
    @solucaos = Solucao.all

    render json: @solucaos
  end

  # GET /solucaos/1
  def show
    render json: @solucao
  end

  # POST /solucaos
  def create
    @solucao = Solucao.new(solucao_params)

    if @solucao.save
      render json: @solucao, status: :created, location: @solucao
    else
      render json: @solucao.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /solucaos/1
  def update
    if @solucao.update(solucao_params)
      render json: @solucao
    else
      render json: @solucao.errors, status: :unprocessable_entity
    end
  end

  # DELETE /solucaos/1
  def destroy
    @solucao.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solucao
      @solucao = Solucao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def solucao_params
      params.require(:solucao).permit(:descricao, :usuario_id, :resultado_id)
    end
end
