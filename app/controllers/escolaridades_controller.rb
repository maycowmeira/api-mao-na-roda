class EscolaridadesController < ApplicationController
  before_action :set_escolaridade, only: [:show, :update, :destroy]

  # GET /escolaridades
  def index
    @escolaridades = Escolaridade.all

    render json: @escolaridades
  end

  # GET /escolaridades/1
  def show
    render json: @escolaridade
  end

  # POST /escolaridades
  def create
    @escolaridade = Escolaridade.new(escolaridade_params)

    if @escolaridade.save
      render json: @escolaridade, status: :created, location: @escolaridade
    else
      render json: @escolaridade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /escolaridades/1
  def update
    if @escolaridade.update(escolaridade_params)
      render json: @escolaridade
    else
      render json: @escolaridade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /escolaridades/1
  def destroy
    @escolaridade.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escolaridade
      @escolaridade = Escolaridade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def escolaridade_params
      params.require(:escolaridade).permit(:descricao)
    end
end
