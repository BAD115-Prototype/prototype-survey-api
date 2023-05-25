class CreateRolUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :rol_usuarios do |t|
      t.references :usuario, null: false, foreign_key: true
      t.references :rol, null: false, foreign_key: { name: 'fk_rol', primary_key: :pk_rol }

      t.timestamps
    end
  end
end
