class RegistroController < ApplicationController
  before_action :set_registro, only: %i[show update destroy]

  # GET /registro
  def index
    @registros = Registro.all

    render json: @registros.as_json(include: :problema)
  end

  # GET /registro/1
  def show
    render json: @registro.as_json(include: :problema)
  end

  # POST /registro
  def create
    @registro = Registro.new(registro_params)

    if @registro.save
      render json: @registro.as_json(include: :problema), status: :created, location: @registro
    else
      render json: @registro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /registro/1
  def update
    if @registro.update(registro_params)
      render json: @registro
    else
      render json: @registro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /registro/1
  def destroy
    @registro.destroy
  end

  private

  def set_registro
    @registro = Registro.find(params[:id])
  end

  def registro_params
    params.require(:registro).permit(:foto_url, :descricao, :problema_id)
  end
end
