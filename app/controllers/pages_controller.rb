class PagesController < ApplicationController
  before_action :find_post, only: [:show]
  before_action :find_group
  def index
    # render json:Post.published.order(created_at: :desc).includes(:user)
    @posts = Post.published.order(created_at: :desc).includes(:user)
  end

  def show
    # render json: Post.friendly.find(params[:post_id])
    @comments = @post.comments.order(id: :desc)
    @comment = @post.comments.new
  end

  private

  def find_post
    @post =Post.friendly.find(params[:post_id])
  end

  def find_group
    @groups = Group.all
  end

  # def find_group
  #   @group = Group.find(params[:id])
  # end
end
