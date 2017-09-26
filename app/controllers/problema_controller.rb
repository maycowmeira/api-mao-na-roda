class ProblemaController < ApplicationController
  before_action :set_problema, only: [:show, :update, :destroy]

  # GET /problema
  def index
    @problemas = Problema.all

    render json: @problemas.as_json(include: [{usuario: { except: :password_digest }}, :tipo_marcacao, :registro])
  end

  # GET /problema/1
  def show
    render json: @problema.as_json(include: [{usuario: { except: :password_digest }}, :tipo_marcacao, :registro])
  end

  # POST /problema
  def create
    @problema = Problema.new(problema_params)

    if @problema.save
      render json: @problema.as_json(include: [{usuario: { except: :password_digest }}, :tipo_marcacao, :registro]), status: :created, location: @problema
    else
      render json: @problema.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /problema/1
  def update
    if @problema.update(problema_params)
      render json: @problema
    else
      render json: @problema.errors, status: :unprocessable_entity
    end
  end

  # DELETE /problema/1
  def destroy
    @problema.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_problema
    @problema = Problema.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
  def problema_params
    params.require(:problema).permit(:lat_inicio, :long_inicio, :lat_final,
    	:long_final, :descricao, :usuario_id, :tipo_marcacao_id)
  end
end