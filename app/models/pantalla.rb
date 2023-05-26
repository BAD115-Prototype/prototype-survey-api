class Pantalla < ApplicationRecord
  self.table_name = "pantallas"
  has_and_belongs_to_many :permiso,  join_table: 'permisos_pantallas'
  validates :nombre_pantalla, presence: true
  validates :url_pantalla, presence: true
end
