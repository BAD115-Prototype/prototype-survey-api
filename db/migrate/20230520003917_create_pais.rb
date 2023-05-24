class CreatePais < ActiveRecord::Migration[7.0]
  def change
    create_table :pais, primary_key: "pk_pais" do |t|
      t.string :nombre_pais, limit: 80

    end
  end
end
