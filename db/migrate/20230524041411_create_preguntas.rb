class CreatePreguntas < ActiveRecord::Migration[7.0]
  def change
    create_table :preguntas,  primary_key: "pk_pregunta" do |t|
      t.string :texto_pregunta
      t.boolean :campo_obligatorio   
      t.references :encuesta, null: false, foreign_key: {primary_key: :pk_encuesta }
      t.references :tipo_pregunta, null: false, foreign_key: {primary_key: :pk_tipo }
      t.timestamps
    end
  end
end
