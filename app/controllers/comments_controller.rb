class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:create]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    # if @comment.save
    #   render js: "alert('留言成功')"
    # end
  end


  private
  def find_post
    @post = Post.friendly.find(params[:post_id])
  end
  def comment_params
    params.require(:comment).permit(:content)
  end
end
