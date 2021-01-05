class AddActivationTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :activation_token, :string, null: false, index: { unique: true }
  end
end
