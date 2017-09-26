class DificuldadeController < ApplicationController
  before_action :set_dificuldade, only: [:show, :update, :destroy]

  # GET /dificuldade
  def index
    @dificuldades = Dificuldade.all

    render json: @dificuldades.as_json(include: [{usuario: { except: :password_digest }}, :dificuldade_cod])
  end

  # GET /dificuldade/1
  def show
    render json: @dificuldade.as_json(include: [{usuario: { except: :password_digest }}, :dificuldade_cod])
  end

  # POST /dificuldade
  def create
    @dificuldade = Dificuldade.new(dificuldade_params)

    if @dificuldade.save
      render json: @dificuldade, status: :created, location: @dificuldade
    else
      render json: @dificuldade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dificuldade/1
  def update
    if @dificuldade.update(dificuldade_params)
      render json: @dificuldade
    else
      render json: @dificuldade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dificuldade/1
  def destroy
    @dificuldade.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dificuldade
      @dificuldade = Dificuldade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dificuldade_params
      params.require(:dificuldade).permit(:valor, :usuario_id, :dificuldade_cod_id)
    end
end