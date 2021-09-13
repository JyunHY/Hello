class PostsController < ApplicationController
  #進入必須是登入狀態
  before_action :authenticate_user!
  #進入edit update destroy時 先使用find_post方法
  before_action :find_post, only: [:edit, :update, :destroy]

  

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.new
    @groups = Group.all
  end  

  def create
     @post = current_user.posts.new(post_params)
     @post.publish! if params[:publish]

    if @post.save
      if params[:publish]
        redirect_to posts_path, notice: '貼文成功'
      else
        redirect_to edit_post_path(@post), notice: '貼文已儲存'
      end
    else
      redirect_to new_post_path, notice: '貼文欄位有錯誤!'
    end
  end
  
  def update
    if @post.update(post_params) #if存檔成功 就redirect_to到posts_path

      case
      when params[:publish]
        @post.publish!
        redirect_to posts_path, notice: '成功發文'
      when params[:unpublish]
        @post.unpublish!
        redirect_to posts_path, notice: '貼文已下架'
      else
        redirect_to edit_post_path(@post), notice: '已儲存貼文'
      end
      

    else #render到edit
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '貼文已刪除'
  end

  def edit
    @groups = Group.all
  end


  private
  #接收資料
  def post_params
    params.require(:post).permit(:title, :content, :group, :cover_image)
  end

  def find_post
    @post = current_user.posts.friendly.find(params[:id])
  end

end
