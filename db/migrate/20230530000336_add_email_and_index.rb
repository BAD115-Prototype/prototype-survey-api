class AddEmailAndIndex < ActiveRecord::Migration[7.0]
  def up
    add_column :encuestados, :email_encuestado, :string
    add_index :encuestados, [:email_encuestado, :fk_encuesta_id], unique: true
  end
end
