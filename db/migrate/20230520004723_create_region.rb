class CreateRegion < ActiveRecord::Migration[7.0]
  def change
    create_table :region, primary_key: "pk_region" do |t|
      t.string :nombre_region, limit:80
      t.references :fk_pais, null: false, foreign_key: { to_table: :pais, primary_key: :pk_pais }

    end
  end
end
