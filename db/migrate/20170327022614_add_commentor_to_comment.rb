class AddCommentorToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :commentor, polymorphic: true
  end
end
