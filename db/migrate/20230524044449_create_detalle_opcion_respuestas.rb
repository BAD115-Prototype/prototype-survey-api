class CreateDetalleOpcionRespuestas < ActiveRecord::Migration[7.0]
  def change
    create_table :detalle_opcion_respuestas do |t|
      t.references :respuesta, null: false, foreign_key: { to_table: :respuestas, primary_key: :pk_respuesta }
      t.references :opcion_respuesta, null: false, foreign_key: { to_table: :opcion_respuestas, primary_key: :pk_opcion_respuesta }
      t.timestamps
    end
  end
end
