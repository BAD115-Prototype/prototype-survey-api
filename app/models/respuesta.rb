class Respuesta < ApplicationRecord
    self.table_name = "respuestas"
    belongs_to :encuestado
    has_and_belongs_to_many :opcion_respuestas,  join_table: 'detalle_opcion_respuestas', foreign_key: 'respuestas_id',
    association_foreign_key: 'opcion_respuestas_id'
end
