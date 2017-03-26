class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :firstname,:lastname,:teacher_id
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :courses
end
