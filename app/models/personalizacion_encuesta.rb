class PersonalizacionEncuesta < ApplicationRecord
  self.table_name = "personalizacion_encuestas"
  belongs_to :encuesta, foreign_key: 'encuesta_id'
end
