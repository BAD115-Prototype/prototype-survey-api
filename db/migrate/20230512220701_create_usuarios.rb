class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string :nombre_usuario
      t.string :email
      t.string :password_digest
      t.boolean :activo

      t.timestamps
    end
  end
end
