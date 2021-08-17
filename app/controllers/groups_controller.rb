class GroupsController < ApplicationController
  #進入必須是登入狀態
  before_action :authenticate_user!
  before_action :find_group, only: [:destroy]
  before_action :find_all_group, only: [:index, :show]
  
  def index
    # @groups = Group.all
    # render json: params
  end

  def new
    @group = Group.new
  end 

  def show
    # render json: params
    @posts = Post.published.where(group: params[:group]).order(created_at: :desc).includes(:user)
    # render json: Post.published.where(group: params[:group]).order(created_at: :desc).includes(:user)
  end 

  def create
    @group = Group.new(group_params)
      if @group.save
        redirect_to groups_path, notice: '新增成功'
      else
        render :new
      end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: '群組已刪除'
    # render json: params
  end

  private
  #接收資料
  def group_params
    params.require(:group).permit(:name)
  end

  def find_group
    @group = Group.find(params[:id])
  end

  def find_all_group
    @groups = Group.all
  end
end
