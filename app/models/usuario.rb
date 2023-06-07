class Usuario < ApplicationRecord
    has_and_belongs_to_many :roles, join_table: :rol_usuarios
    has_secure_password

    validates_presence_of :email 
    validates_uniqueness_of :email

    has_many :encuestas, foreign_key: 'usuario_id'

    #before_save :validar_intentos 

    #private

    #def validar_intentos
       # self.activo = false if self.intentos >= 3
    #end
end
