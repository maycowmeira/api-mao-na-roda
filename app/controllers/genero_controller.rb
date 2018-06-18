class GeneroController < ApplicationController
  before_action :set_genero, only: %i[show update destroy]

  # GET /genero
  def index
    @generos = Genero.all

    render json: @generos
  end

  # GET /genero/1
  def show
    render json: @genero
  end

  # POST /generos
  def create
    @genero = Genero.new(genero_params)

    if @genero.save
      render json: @genero, status: :created, location: @genero
    else
      render json: @genero.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genero/1
  def update
    if @genero.update(genero_params)
      render json: @genero
    else
      render json: @genero.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genero/1
  def destroy
    @genero.destroy
  end

  private

  def set_genero
    @genero = Genero.find(params[:id])
  end

  def genero_params
    params.require(:genero).permit(:descricao)
  end
end
