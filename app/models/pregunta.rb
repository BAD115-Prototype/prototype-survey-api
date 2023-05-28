class Pregunta < ApplicationRecord
    self.table_name = "preguntas"
    belongs_to :encuesta, foreign_key: "pk_encuesta"
    has_one :tipo_pregunta
end
