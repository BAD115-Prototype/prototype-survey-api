class Rol < ApplicationRecord
    self.primary_key = :pk_rol
    has_and_belongs_to_many :usuarios, join_table: :rol_usuarios
end
