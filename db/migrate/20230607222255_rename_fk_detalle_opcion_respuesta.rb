class RenameFkDetalleOpcionRespuesta < ActiveRecord::Migration[7.0]
  def change
    rename_column :detalle_opcion_respuestas, :respuesta_id, :respuestas_id
    rename_column :detalle_opcion_respuestas, :opcion_respuesta_id, :opcion_respuestas_id
  end
end
