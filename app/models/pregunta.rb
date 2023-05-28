class Pregunta < ApplicationRecord
    self.table_name = "preguntas"
    belongs_to  :encuesta, foreign_key: "encuesta_id"
    has_many :opcionRespuestas, foreign_key: "fk_pregunta_id", dependent: :destroy
    has_one :tipo_pregunta
end
