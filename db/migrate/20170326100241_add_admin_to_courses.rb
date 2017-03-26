class AddAdminToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :admin, foreign_key: true
  end
end
