class AddTokenAndSecretToAuthorization < ActiveRecord::Migration
  def change
    add_column :authorizations, :token, :string
    add_column :authorizations, :secret, :string
    add_column :authorizations, :created_at, :datetime
    add_column :authorizations, :updated_at, :datetime
  end
end
