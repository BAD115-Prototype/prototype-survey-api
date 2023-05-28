class OpcionRespuesta < ApplicationRecord
    self.table_name = "opcion_respuestas"
    belongs_to :pregunta, foreign_key: "fk_pregunta_id"
    validates :texto_opcion, presence: true
end
