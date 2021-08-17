class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:create]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    unless @comment.save
      render js: "alert('留言失敗, 內容不可空白')"
    end
  end


  private
  def find_post
    @post = Post.friendly.find(params[:post_id])
  end
  def comment_params
    params.require(:comment).permit(:content)
  end
end
