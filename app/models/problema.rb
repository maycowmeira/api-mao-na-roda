class Problema < ApplicationRecord
  belongs_to :usuario
  belongs_to :tipo_marcacao
  belongs_to :solucao
end
