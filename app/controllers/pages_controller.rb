class PagesController < ApplicationController
  before_action :find_post, only: [:show]
  before_action :find_group, :find_relikes
  def index
    # render json:Post.published.order(created_at: :desc).includes(:user)
    @posts = Post.published.order(created_at: :desc).includes(:user)
    # render json: @posts
    

  end

  def show
    @comments = @post.comments.order(id: :desc)
    @comment = @post.comments.new
    # render json: @post
    ActionCable.server.broadcast("room_channel", {message: "hello"})
  end

  def asd
    @user = User.find_by(username: params[:username])
    @userposts = Post.published.where(user_id: @user.id).order(created_at: :desc).includes(:user)
    # render json: @userposts
  end

  private

  def find_post
    @post =Post.friendly.find(params[:post_id])
  end

  def find_group
    @groups = Group.all
  end

  def find_relikes
    @relikes = Like.where( :liked => @post).count
  end
end
