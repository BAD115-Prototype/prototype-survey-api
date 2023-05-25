class CreatePersonalizacionEncuestas < ActiveRecord::Migration[7.0]
  def change
    create_table :personalizacion_encuestas, primary_key: "pk_personalizacion_encuesta" do |t|
      t.string :tipografia, limit: 100
      t.string :imagen, limit: 255
      t.string :color_fondo, limit: 6
      t.string :color_principal, limit: 6
      t.references :encuesta, null: false, foreign_key: { to_table: :encuestas, primary_key: :pk_encuesta }
    end
  end
end
