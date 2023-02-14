class LikesController < ApplicationController
  def like_a_post
    Like.create(post_id: params[:id], user_id: current_user.id)

    redirect_back(fallback_location: root_path)
  end

  def dislike_a_post
    Like.destroy_by(post_id: params[:id], user_id: current_user.id)

    redirect_back(fallback_location: root_path)
  end
end
