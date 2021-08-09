class AddStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :specialty, :string
    add_column :users, :occupation, :string
  end
end
