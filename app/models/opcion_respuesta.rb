class OpcionRespuesta < ApplicationRecord
    self.table_name = 'opcion_respuestas'
    #belongs_to :preguntas, foreign_key: 'fk_pregunta_id', class_name: 'Pregunta', primary_key: 'pk_pregunta'
    
    validates :texto_opcion, presence: true
end
