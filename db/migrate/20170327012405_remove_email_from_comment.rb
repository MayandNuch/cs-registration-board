class RemoveEmailFromComment < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :email
  end
end
