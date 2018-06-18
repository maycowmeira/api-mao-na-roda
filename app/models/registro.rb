class Registro < ActiveRecord::Base
  self.table_name = 'cadeirante.registro'

  belongs_to :problema
end
