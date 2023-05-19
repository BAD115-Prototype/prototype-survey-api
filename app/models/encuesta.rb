class Encuesta < ApplicationRecord
  has_many :criterios
  has_one :personalizacion_encuesta
end
