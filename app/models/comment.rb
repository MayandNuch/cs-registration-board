class Comment < ApplicationRecord
  belongs_to :courses
  belongs_to :commentor, polymorphic: true
end
