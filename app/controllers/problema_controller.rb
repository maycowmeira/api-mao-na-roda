class ProblemaController < ApplicationController
  before_action :set_problema, only: [:show, :update, :destroy]
  before_action :fetch_problemas, only: :index

  # GET /problema
  def index
    render json: @problemas.as_json(include: [{usuario: { except: :password_digest }}, :tipo_marcacao, :registro, :solucao])
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

  # endpoint pra contar o numero de problema de um determinado mes
  def frequencia
    @frequencia = Frequencia.new(
      frequencia_params[:freq_mes_start],
      frequencia_params[:freq_mes_end],
      frequencia_params[:freq_ano_start],
      frequencia_params[:freq_ano_end],
      Problema).frequencia
    render json: @frequencia
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_problema
    @problema = Problema.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def problema_params
    # params.require(:problema).permit(:lat_inicio, :long_inicio, :lat_final,
    # 	:long_final, :descricao, :usuario_id, :tipo_marcacao_id,
    # 	:prob_start, :prob_end, :sol_start, :sol_end)
  	params.permit(:lat_inicio, :long_inicio, :lat_final,
  	  :long_final, :descricao, :usuario_id, :tipo_marcacao_id,
    	:prob_start, :prob_end, :sol_start, :sol_end, :problema)
  end

  def frequencia_params
    params.permit(:freq_mes_start, :freq_mes_end, :freq_ano_start, :freq_ano_end)
  end

  def fetch_problemas
    if problema_params[:prob_start] || problema_params[:prob_end]
      start_period = DateTime.parse(problema_params[:prob_start]) rescue nil || DateTime.parse('19710101')
      end_period = DateTime.parse(problema_params[:prob_end]) + 1.day rescue nil || Time.zone.now
      @problemas = Problema.where(data_hora_reporte: start_period..end_period)
    elsif problema_params[:sol_start] || problema_params[:sol_end]
      start_period = DateTime.parse(problema_params[:sol_start]) rescue nil || DateTime.parse('19710101')
      end_period = DateTime.parse(problema_params[:sol_end]) + 1.day rescue nil || Time.zone.now
      @problemas = Solucao.where(data_hora: start_period..end_period).map(&:problema).uniq
    else
      @problemas = Problema.all
    end
  end
end
