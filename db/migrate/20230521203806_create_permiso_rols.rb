class CreatePermisoRols < ActiveRecord::Migration[7.0]
  def change
    create_table :permiso_rols do |t|
      t.references :permiso, null: false, foreign_key: { primary_key: :pk_permiso }
      t.references :rol, null: false, foreign_key: {primary_key: :pk_rol }

      t.timestamps
    end
  end
end
