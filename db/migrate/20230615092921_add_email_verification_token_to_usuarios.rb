class AddEmailVerificationTokenToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :email_verification_token, :string, null: true
    add_index :usuarios, :email_verification_token, unique: true, where: 'email_verification_token IS NOT NULL'
  end
end
