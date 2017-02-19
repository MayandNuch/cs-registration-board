class AddDetailsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :firstname, :string
    add_column :students, :lastname, :string
    add_column :students, :student_id, :string
  end
end
