class Dificuldade < ApplicationRecord
  self.table_name = "dificuldade"
  
  belongs_to :usuario
  belongs_to :dificuldade_cod
end