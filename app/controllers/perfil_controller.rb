class PerfilController < ApplicationController
  before_action :set_perfil, only: %i[show update destroy]

  # GET /perfil
  def index
    @perfils = Perfil.all

    render json: @perfils
  end

  # GET /perfil/1
  def show
    render json: @perfil
  end

  # POST /perfil
  def create
    @perfil = Perfil.new(perfil_params)

    if @perfil.save
      render json: @perfil, status: :created, location: @perfil
    else
      render json: @perfil.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /perfil/1
  def update
    if @perfil.update(perfil_params)
      render json: @perfil
    else
      render json: @perfil.errors, status: :unprocessable_entity
    end
  end

  # DELETE /perfil/1
  def destroy
    @perfil.destroy
  end

  private

  def set_perfil
    @perfil = Perfil.find(params[:id])
  end

  def perfil_params
    params.require(:perfil).permit(:descricao)
  end
end
