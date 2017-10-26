class RenameColumnGoogleAuth2inTableUserstoProvider < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :google_oauth2, :provider
  end
end
