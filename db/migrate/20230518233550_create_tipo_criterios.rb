class CreateTipoCriterios < ActiveRecord::Migration[7.0]
  def change
    create_table :tipo_criterios, primary_key: "pk_tipo_criterio" do |t|
      t.text :nombre_tipo_criterios
    end
  end
end
