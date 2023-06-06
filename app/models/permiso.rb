class Permiso < ApplicationRecord
    has_and_belongs_to_many :rols, join_table: :permiso_rols
    has_and_belongs_to_many :pantallas,  join_table: :permisos_pantallas
end

