class RemoveRelationFromPantallas < ActiveRecord::Migration[7.0]
  def up
    remove_column :pantallas, :permiso_id
  end

  def down
    add_reference :pantallas, :permiso, null: false,foreign_key: { primary_key: :pk_permiso }
  end
end
