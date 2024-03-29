class CreateCriterios < ActiveRecord::Migration[7.0]
  def change
    create_table :criterios, primary_key: "pk_criterio" do |t|
      t.string :descripcion_criterio, limit: 120
      t.integer :valor_criterio
      t.references :encuesta, null: false, foreign_key: { to_table: :encuestas, primary_key: :pk_encuesta }
      t.references :tipo_criterio, null: false, foreign_key: { to_table: :tipo_criterios, primary_key: :pk_tipo_criterio }
    end
  end
end