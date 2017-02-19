class AddDetailsToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :firstname, :string
    add_column :teachers, :lastname, :string
    add_column :teachers, :teacher_id, :string
  end
end
