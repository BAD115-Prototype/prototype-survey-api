class CreateTipoPregunta < ActiveRecord::Migration[7.0]
  def change
    create_table :tipo_pregunta, primary_key: "pk_tipo" do |t|
      t.string :descripcion_tipo, limit:30

    end
  end
end
