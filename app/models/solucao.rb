class Solucao < ActiveRecord::Base
    self.table_name = "solucao"

    belongs_to :usuario
    belongs_to :resultado
    belongs_to :problema

    before_validation :set_data_hora

    private

    def set_data_hora
      self.data_hora = Time.zone.now
    end
end
