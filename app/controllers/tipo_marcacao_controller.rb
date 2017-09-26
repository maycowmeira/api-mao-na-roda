class TipoMarcacaoController < ApplicationController
  before_action :set_tipo_marcacao, only: [:show, :update, :destroy]

  # GET /tipo_marcacao
  def index
    @tipo_marcacaos = TipoMarcacao.all

    render json: @tipo_marcacaos
  end

  # GET /tipo_marcacao/1
  def show
    render json: @tipo_marcacao
  end

  # POST /tipo_marcacao
  def create
    @tipo_marcacao = TipoMarcacao.new(tipo_marcacao_params)

    if @tipo_marcacao.save
      render json: @tipo_marcacao, status: :created, location: @tipo_marcacao
    else
      render json: @tipo_marcacao.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipo_marcacao/1
  def update
    if @tipo_marcacao.update(tipo_marcacao_params)
      render json: @tipo_marcacao
    else
      render json: @tipo_marcacao.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipo_marcacao/1
  def destroy
    @tipo_marcacao.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_tipo_marcacao
    @tipo_marcacao = TipoMarcacao.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
  def tipo_marcacao_params
	  params.require(:tipo_marcacao).permit(:descricao)
  end
end