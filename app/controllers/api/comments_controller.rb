class Api::CommentsController < Api::BaseController

  def comlike
    comment = Comment.find(params[:id])
    render json: {status: current_user.comlike!(comment)}
  end

end