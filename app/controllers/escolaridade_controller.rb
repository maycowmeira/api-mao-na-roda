class EscolaridadeController < ApplicationController
  before_action :set_escolaridade, only: %i[show update destroy]

  # GET /escolaridade
  def index
    @escolaridades = Escolaridade.all

    render json: @escolaridades
  end

  # GET /escolaridade/1
  def show
    render json: @escolaridade
  end

  # POST /escolaridade
  def create
    @escolaridade = Escolaridade.new(escolaridade_params)

    if @escolaridade.save
      render json: @escolaridade, status: :created, location: @escolaridade
    else
      render json: @escolaridade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /escolaridade/1
  def update
    if @escolaridade.update(escolaridade_params)
      render json: @escolaridade
    else
      render json: @escolaridade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /escolaridade/1
  def destroy
    @escolaridade.destroy
  end

  private

  def set_escolaridade
    @escolaridade = Escolaridade.find(params[:id])
  end

  def escolaridade_params
    params.require(:escolaridade).permit(:descricao)
  end
end
