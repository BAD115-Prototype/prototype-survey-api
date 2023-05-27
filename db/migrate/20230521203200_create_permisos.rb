class CreatePermisos < ActiveRecord::Migration[7.0]
  def change
    create_table :permisos, primary_key: "pk_permiso"  do |t|
      t.string :nombre_permiso
      t.timestamps
    end
  end
end
