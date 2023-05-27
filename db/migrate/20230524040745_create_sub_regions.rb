class CreateSubRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_regions do |t|
      t.string :nombre_sub_region
      t.references :fk_region, null: false, foreign_key: { to_table: :region, primary_key: :pk_region }
      t.timestamps
    end
  end
end
