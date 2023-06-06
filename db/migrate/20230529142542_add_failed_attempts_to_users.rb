class AddFailedAttemptsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :intentos, :integer, default: 0
  end
end
