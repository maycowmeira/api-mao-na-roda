class UsuarioController < ApplicationController
  
  skip_before_action :authenticate_request, only: [:create]
  
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuario
  def index
    @usuarios = Usuario.all
    
    if current_user.admin?
      render json: @usuarios.as_json(include: [:escolaridade, :perfil, :genero, :dificuldade])
    else
      render json: @usuarios.as_json(include: [:escolaridade, :perfil, :genero, :dificuldade], except:[:password_digest])
    end
  end

  # GET /usuario/1
  def show
    if current_user.admin?
      render json: @usuario.as_json(include: [:escolaridade, :perfil, :genero])
    else
      render json: @usuario.as_json(include: [:escolaridade, :perfil, :genero], except: [:password_digest]) 
    end
  end

  # POST /usuario
  def create
    @usuario = Usuario.new(usuario_params)
    
    if @usuario.save
      render json: @usuario, status: :created, location: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuario/1
  def update
    if @usuario.update(usuario_params)
      render json: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuario/1
  def destroy
    if current_user.admin?
      @usuario.destroy 
    else
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def usuario_params
      
      # Nao pode criar usuarios com perfil admin, cria um android 
      if params.values_at(:perfil_id).first == 1
        params[:perfil_id] = 2
      end
      
      params.permit(:nome, :email, :ano, :password, :password_confirmation, 
        :profissao, :restricao, :restricao_outras, :genero_id, :perfil_id, 
        :escolaridade_id)
    end
end
