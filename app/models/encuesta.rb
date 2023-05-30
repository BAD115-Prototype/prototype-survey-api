class Encuesta < ApplicationRecord
  self.table_name = "encuestas"
  has_many :criterios
  has_many :preguntas, dependent: :destroy
  has_one :personalizacion_encuesta, dependent: :destroy
  belongs_to :usuario
end
