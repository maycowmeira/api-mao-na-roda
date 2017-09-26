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
end