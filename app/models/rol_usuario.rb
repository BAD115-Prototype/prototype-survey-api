class RolUsuario < ApplicationRecord
  self.table_name = "rol_usuarios"
  belongs_to :usuario
  belongs_to :rol
end
