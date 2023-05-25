class CreatePantallas < ActiveRecord::Migration[7.0]
  def change
    create_table :pantallas do |t|
      t.references :permiso, null: false, foreign_key: { primary_key: :pk_permiso }
      t.string :nombre_pantalla, limit: 25
      t.string :url_pantalla

      t.timestamps
    end
  end
end
