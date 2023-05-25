class CreateRespuestas < ActiveRecord::Migration[7.0]
  def change
    create_table :respuestas,  primary_key: "pk_respuesta" do |t|
      t.string :valor_respuesta
      t.references :encuestado, null: false, foreign_key: {primary_key: :pk_encuestado }
      t.timestamps
    end
  end
end
