class Usuario < ApplicationRecord
    has_and_belongs_to_many :roles, join_table: :rol_usuarios
    has_secure_password

    validates_presence_of :email 
    validates_uniqueness_of :email
end
