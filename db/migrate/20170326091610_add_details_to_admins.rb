class AddDetailsToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :firstname, :string
    add_column :admins, :lastname, :string
  end
end
