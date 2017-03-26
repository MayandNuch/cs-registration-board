class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :firstname,:lastname
  devise :database_authenticatable, :registerable,
        :rememberable,:validatable

end
