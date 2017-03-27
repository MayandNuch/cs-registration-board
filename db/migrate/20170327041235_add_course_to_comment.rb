class AddCourseToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :course, foreign_key: true
  end
end
