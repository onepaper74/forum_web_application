class RenamePassToPasswordDigestInUsers < ActiveRecord::Migration[8.0]
  def change
      rename_column :users, :pass, :password_digest
  end
end
