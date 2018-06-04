class SolucaoController < ApplicationController
  before_action :set_solucao, only: [:show, :update, :destroy]

  # GET /solucao
  def index
    @solucaos = Solucao.all

    render json: @solucaos.as_json(include: [
        {usuario: { except: :password_digest }},
        :resultado,
        :problema
      ])
  end

  # GET /solucao/1
  def show
    render json: @solucao.as_json(include: [
        {usuario: { except: :password_digest }},
        :resultado,
        :problema
      ])
  end

  # POST /solucao
  def create
    @solucao = Solucao.new(solucao_params)

    if @solucao.save
      render json: @solucao.as_json(
        include: [
            {usuario: { except: :password_digest }},
            :resultado,
            :problema
          ]
        ), status: :created, location: @solucao
    else
      render json: @solucao.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /solucao/1
  def update
    if @solucao.update(solucao_params)
      render json: @solucao
    else
      render json: @solucao.errors, status: :unprocessable_entity
    end
  end

  # DELETE /solucao/1
  def destroy
    @solucao.destroy
  end

  def frequencia
    @frequencia = Frequencia.new(
      frequencia_params[:freq_mes_start],
      frequencia_params[:freq_mes_end],
      frequencia_params[:freq_ano_start],
      frequencia_params[:freq_ano_end],
      Solucao).frequencia
    render json: @frequencia
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_solucao
    @solucao = Solucao.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def solucao_params
    params.require(:solucao).permit(:descricao, :usuario_id, :resultado_id,
      :problema_id)
  end

  def frequencia_params
    params.permit(:freq_mes_start, :freq_mes_end, :freq_ano_start, :freq_ano_end)
  end
end
