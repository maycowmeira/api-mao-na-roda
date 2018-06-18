class Problema < ActiveRecord::Base
  self.table_name = 'cadeirante.problema'

  belongs_to :usuario
  belongs_to :tipo_marcacao
  has_many :registro
  has_one :solucao

  before_create :set_data_hora_reporte

  private

  def set_data_hora_reporte
    self.data_hora_reporte = Time.zone.now
  end
end
