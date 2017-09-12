class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :update, :destroy]

  # GET /registros
  def index
    @registros = Registro.all

    render json: @registros
  end

  # GET /registros/1
  def show
    render json: @registro
  end

  # POST /registros
  def create
    @registro = Registro.new(registro_params)

    if @registro.save
      render json: @registro, status: :created, location: @registro
    else
      render json: @registro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /registros/1
  def update
    if @registro.update(registro_params)
      render json: @registro
    else
      render json: @registro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /registros/1
  def destroy
    @registro.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro
      @registro = Registro.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registro_params
      params.require(:registro).permit(:foto_url, :descricao, :problema_id)
    end
end
