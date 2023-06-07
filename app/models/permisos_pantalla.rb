class PermisosPantalla < ApplicationRecord
  self.table_name = "permisos_pantallas"
  belongs_to :permisos
  belongs_to :pantallas
end
