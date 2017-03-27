class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :firstname,:lastname,:student_id
  devise :database_authenticatable, :registerable,
        :rememberable,:validatable

  has_and_belongs_to_many :courses
  has_many :comments, as: :commentor
end
