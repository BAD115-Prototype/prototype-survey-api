class RemoveEmailUnique < ActiveRecord::Migration[7.0]
  def up
    remove_column :encuestados, :email_encuestado
    add_reference :encuestados, :fk_encuesta, null: false, foreign_key: { to_table: :encuestas, primary_key: :pk_encuesta }
  end

  def down
    add_column :encuestados, :email_encuestado, :string
  end
end
