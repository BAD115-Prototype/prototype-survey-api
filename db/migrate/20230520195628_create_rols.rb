class CreateRols < ActiveRecord::Migration[7.0]
  def change
    create_table :rols,  primary_key: "pk_rol"  do |t|
      t.string :descripcion_rol
      t.timestamps
    end
  end
end
