class Api::PostsController < Api::BaseController
  
  def like 
      post = Post.friendly.find(params[:id])
      render json: {status: current_user.like!(post)}
  end
  
end