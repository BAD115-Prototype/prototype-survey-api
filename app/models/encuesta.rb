class Encuesta < ApplicationRecord
  self.table_name = "encuestas"
  has_many :criterios
  has_one :personalizacion_encuesta, dependent: :destroy
  belongs_to :usuario
end
