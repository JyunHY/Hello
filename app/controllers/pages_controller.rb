class PagesController < ApplicationController

  def index
    @posts = Post.published.order(created_at: :desc).includes(:user)
    @groups = Group.all
  end

  def show

  end

  private

  def find_post
    @post =Post.find(params[:id])
  end
end
