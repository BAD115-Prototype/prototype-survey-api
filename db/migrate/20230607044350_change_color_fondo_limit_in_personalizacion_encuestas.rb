class ChangeColorFondoLimitInPersonalizacionEncuestas < ActiveRecord::Migration[7.0]
  def change
    change_column :personalizacion_encuestas, :color_fondo, :string, limit: 7
    change_column :personalizacion_encuestas, :color_principal, :string, limit: 7
  end
end
