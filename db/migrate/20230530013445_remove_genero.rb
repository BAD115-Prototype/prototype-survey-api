class RemoveGenero < ActiveRecord::Migration[7.0]
  def up
    remove_column :encuestados, :genero_id
    remove_column :encuestados, :sub_region_id
  end
end
