class Encuesta < ApplicationRecord
  self.table_name = "encuestas"
  has_many :criterios
  has_many :preguntas
  has_many  :encuestados,  foreign_key: "fk_encuesta_id"
  has_one :personalizacion_encuesta, dependent: :destroy
  belongs_to :usuario
end
