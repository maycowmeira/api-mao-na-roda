class Registro < ActiveRecord::Base
    self.table_name = "registro"

    belongs_to :problema
end
