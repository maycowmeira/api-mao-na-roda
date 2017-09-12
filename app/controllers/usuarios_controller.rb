class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuarios
  def index
    @usuarios = Usuario.all
    
    if current_user.admin?
      render json: @usuarios
    else
      render json: @usuarios.collect { |u| u.attributes.except('password_digest') }
    end
  end

  # GET /usuarios/1
  def show
    if current_user.admin?
      render json: @usuario
    else
      render json: @usuario.attributes.except("password_digest")
    end
  end

  # POST /usuarios
  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      render json: @usuario, status: :created, location: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuarios/1
  def update
    if @usuario.update(usuario_params)
      render json: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuarios/1
  def destroy
    @usuario.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def usuario_params
      # params.require(:usuario).permit(:nome, :email, :password_digest, :ano, :profissao, :restricao, :restricao_outras, :genero_id, :perfil_id, :escolaridade_id)
      params.require(:usuario).permit(:nome, :email, :password, :password_confirmation, :ano, :profissao, :restricao, :restricao_outras, :genero_id, :perfil_id, :escolaridade_id)
    end
end
