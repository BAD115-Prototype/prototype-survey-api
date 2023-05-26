class CreatePermisosPantallas < ActiveRecord::Migration[7.0]
  def change
    create_table :permisos_pantallas do |t|
      t.references :permiso, null: false, foreign_key: { primary_key: :pk_permiso }
      t.references :pantalla, null: false, foreign_key: true

      t.timestamps
    end
  end
end
