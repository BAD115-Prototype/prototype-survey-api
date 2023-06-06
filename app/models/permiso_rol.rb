class PermisoRol < ApplicationRecord
  self.table_name = "permiso_rols"
  belongs_to :permisos
  belongs_to :rols
end

