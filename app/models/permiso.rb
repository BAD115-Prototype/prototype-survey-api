class Permiso < ApplicationRecord
    has_and_belongs_to_many :rols, join_table: :permiso_rol
    has_many :pantallas
end
