class CreateOpcionRespuestas < ActiveRecord::Migration[7.0]
  def change
    create_table :opcion_respuestas, primary_key: "pk_opcion_respuesta" do |t|
      t.string :texto_opcion
      t.references :fk_pregunta, null: false, foreign_key: { to_table: :preguntas, primary_key: :pk_pregunta }
      t.timestamps
    end
  end
end
