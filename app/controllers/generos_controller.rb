class GenerosController < ApplicationController
  before_action :set_genero, only: [:show, :update, :destroy]

  # GET /generos
  def index
    @generos = Genero.all

    render json: @generos
  end

  # GET /generos/1
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

  # PATCH/PUT /generos/1
  def update
    if @genero.update(genero_params)
      render json: @genero
    else
      render json: @genero.errors, status: :unprocessable_entity
    end
  end

  # DELETE /generos/1
  def destroy
    @genero.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genero
      @genero = Genero.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def genero_params
      params.require(:genero).permit(:descricao)
    end
end
