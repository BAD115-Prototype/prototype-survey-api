class AddRelationFromSubrgion < ActiveRecord::Migration[7.0]
  def up
    add_reference :sub_regions, :fk_region, null: false, foreign_key: { to_table: :region, primary_key: :pk_region }
  end
  def down
    remove_column :sub_regions, :fk_region
  end
end
