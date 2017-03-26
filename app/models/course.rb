class Course < ApplicationRecord
  belongs_to :user, polymorphic: true
  has_and_belongs_to_many :students
end
