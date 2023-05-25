class CreateDetalleOpcionRespuestas < ActiveRecord::Migration[7.0]
  def change
    create_table :detalle_opcion_respuestas do |t|
      t.references :respuestas, null: false, foreign_key: { primary_key: :pk_respuesta }
      t.references :opcion_respuestas, null: false, foreign_key: { primary_key: :pk_opcion_respuesta }
      t.timestamps
    end
  end
end