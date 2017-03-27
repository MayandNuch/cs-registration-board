class Comment < ApplicationRecord
  belongs_to :course
  belongs_to :commentor, polymorphic: true
end
