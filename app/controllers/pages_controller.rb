class PagesController < ApplicationController
  def home
    @posts = Post.all
    @nicknameList = []
    @posts.each do |post|
      name = User.find(post.user_id).name
      @nicknameList << name
    end
  end
end
