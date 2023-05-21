class CreateEncuestas < ActiveRecord::Migration[7.0]
  def change
    create_table :encuestas, primary_key: "pk_encuesta" do |t|
      t.string :titulo_encuesta, limit: 120
      t.text :objetivo_encuesta
      t.text :indicacion_encuesta
      t.datetime :fecha_creacion_encuesta
      t.datetime :fecha_actualizacion_encuesta
      t.string :link_encuesta, limit: 255
      t.boolean :estado_encuesta
      t.datetime :fecha_inicio_encuesta
      t.datetime :fecha_finalizacion_encuesta
      t.references :fk_usuario, null: false, foreign_key: { to_table: :usuarios }
    end
  end
end

