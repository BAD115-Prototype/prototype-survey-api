class CreateEncuestas < ActiveRecord::Migration[7.0]
  def change
    create_table :encuestas, primary_key: "pk_encuesta" do |t|
      t.string :titulo_encuesta
      t.text :objetivo_encuesta
      t.text :indicacion_encuesta
      t.datetime :fecha_creacion_encuesta
      t.datetime :fecha_actualizacion_encuesta
      t.string :link_encuesta
      t.boolean :estado_encuesta
      t.datetime :fecha_inicio_encuesta
      t.datetime :fecha_finalizacion_encuesta
      

    end
  end
end

