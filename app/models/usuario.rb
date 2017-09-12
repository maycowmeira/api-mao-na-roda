class Usuario < ApplicationRecord
  # Relations
  belongs_to :genero
  belongs_to :perfil
  belongs_to :escolaridade
  
  # JWT
  has_secure_password
  
  # Validations
  validates :email, presence: true
  validates :nome, presence: true
  validates :perfil_id, presence: true
  
  def admin? 
    perfil_id == 1
  end
end
