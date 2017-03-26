class AddUserToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :user, polymorphic: true, index: true
  end
end
