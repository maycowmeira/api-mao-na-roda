class Problema < ActiveRecord::Base
  self.table_name = "problema"

  belongs_to :usuario
  belongs_to :tipo_marcacao
  has_many :registro
  has_many :solucao

  before_validation :set_data_hora_reporte

  private

  def set_data_hora_reporte
      self.data_hora_reporte = Time.zone.now
  end
end


