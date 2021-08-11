class GroupsController < ApplicationController
  #進入必須是登入狀態
  before_action :authenticate_user!

  before_action :find_group, only: [:destroy]

  def index
    @groups = Group.all.order(created_at: :desc)
  end

  def new
    @group = Group.new
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
end
