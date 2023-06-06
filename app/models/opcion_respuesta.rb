class OpcionRespuesta < ApplicationRecord
    self.table_name = "opcion_respuestas"
    has_and_belongs_to_many :respuestas,  join_table: 'detalle_opcion_respuestas', foreign_key: 'opcion_respuestas_id', association_foreign_key: 'respuestas_id'
    belongs_to :pregunta, foreign_key: "fk_pregunta_id"
    validates :texto_opcion, presence: true
end
