class Post < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: "Post", optional: true
  has_many :posts, foreign_key: :parent_id
  has_many :likes

  has_one_attached :image

  after_create_commit { broadcast_append_to "posts" }

  def is_friend_post(current_user)
    begin
      current_user.followees.find(self.user_id)
      return true
    rescue
      return false
    end
  end

  def is_liked(current_user)
    self.likes.find_by(user_id: current_user.id)
  end
end
