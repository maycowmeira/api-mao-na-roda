class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.pluralize_table_names = false
end
