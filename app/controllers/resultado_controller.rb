class ResultadoController < ApplicationController
  before_action :set_resultado, only: %i[show update destroy]

  # GET /resultado
  def index
    @resultados = Resultado.all

    render json: @resultados
  end

  # GET /resultado/1
  def show
    render json: @resultado
  end

  # POST /resultado
  def create
    @resultado = Resultado.new(resultado_params)

    if @resultado.save
      render json: @resultado, status: :created, location: @resultado
    else
      render json: @resultado.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resultado/1
  def update
    if @resultado.update(resultado_params)
      render json: @resultado
    else
      render json: @resultado.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resultado/1
  def destroy
    @resultado.destroy
  end

  private

  def set_resultado
    @resultado = Resultado.find(params[:id])
  end

  def resultado_params
    params.require(:resultado).permit(:descricao)
  end
end
