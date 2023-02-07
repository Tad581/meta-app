class PagesController < ApplicationController
  def home
    @posts = Post.all
    @nicknameList = []
    @posts.each do |post|
      name = User.find(post.user_id).name
      @nicknameList << name
    end
  end

  def search
    @parameters = params[:query].downcase
    if !@parameters.blank?
      @search_user = User.all.where("id <> #{current_user.id} and lower(name) LIKE '%#{@parameters}%'")
    else
      @search_user = []
    end
  end
end
