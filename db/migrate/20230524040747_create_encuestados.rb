class CreateEncuestados < ActiveRecord::Migration[7.0]
  def change
    create_table :encuestados do |t|
      t.string :nombre_encuestado
      t.string :apellido_encuestado
      t.string :email_encuestado, :unique => true
      t.date :fecha_nacimiento
      t.references :genero, null: false, foreign_key: { to_table: :generos }
      t.references :sub_region, null: false, foreign_key: { to_table: :sub_regions }

      t.timestamps
    end
  end
end
