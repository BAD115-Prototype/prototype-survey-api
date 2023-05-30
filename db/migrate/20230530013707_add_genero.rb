class AddGenero < ActiveRecord::Migration[7.0]
  def change
    add_reference :encuestados, :genero, null: true, foreign_key: { to_table: :generos }
    add_reference :encuestados, :sub_region, null: true, foreign_key: { to_table: :sub_regions }
  end
end
