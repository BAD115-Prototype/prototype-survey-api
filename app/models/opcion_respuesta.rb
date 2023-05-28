class OpcionRespuesta < ApplicationRecord
    self.table_name = "opcion_respuestas"
    belongs_to :pregunta, foreign_key: "fk_pregunta_id"
end
