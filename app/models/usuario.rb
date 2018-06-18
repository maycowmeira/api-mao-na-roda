class Usuario < ActiveRecord::Base
  self.table_name = 'cadeirante.usuario'

  # Relations
  belongs_to :genero
  belongs_to :perfil
  belongs_to :escolaridade
  has_many   :dificuldade

  # JWT
  has_secure_password

  # Validations
  validates :email, presence: true
  validates :nome, presence: true
  validates :genero_id, presence: true
  validates :perfil_id, presence: true
  validates :escolaridade_id, presence: true

  def admin?
    perfil_id == 1
  end

  def android?
    perfil_id == 2
  end

  def prefeitura?
    perfil_id == 3
  end
end
