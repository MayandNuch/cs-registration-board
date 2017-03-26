class RemoveAdminAndTeacherFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :teacher_id
    remove_column :courses, :admin_id
  end
end
