class AddFirstnameAndLastNameToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :firstname, :String
    add_column :comments, :lastname, :string
  end
end
