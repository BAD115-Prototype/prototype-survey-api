class Encuestado < ApplicationRecord
    belongs_to :genero, foreign_key: "genero_id"
    belongs_to :encuesta,  foreign_key: "fk_encuesta_id"
    has_many :respuestas, dependent: :destroy
end
