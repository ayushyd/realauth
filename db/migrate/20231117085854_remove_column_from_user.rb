class RemoveColumnFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :authentication_token, :string
  end
end
