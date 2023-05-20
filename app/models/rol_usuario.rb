class RolUsuario < ApplicationRecord
  belongs_to :usuario
  belongs_to :rol
end
