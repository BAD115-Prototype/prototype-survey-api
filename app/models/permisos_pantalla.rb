class PermisosPantalla < ApplicationRecord
  self.table_name = "permisos_pantallas"
  belongs_to :permiso
  belongs_to :pantalla
end
