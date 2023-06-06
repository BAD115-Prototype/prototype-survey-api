class DetalleOpcionRespuestas < ApplicationRecord
    belongs_to :respuesta, foreign_key: "respuestas_id"
    belongs_to :opcionRespuesta, foreign_key: "opcion_respuestas_id"
end
