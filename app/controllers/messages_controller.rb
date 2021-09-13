class MessagesController < ApplicationController
  #進入必須是登入狀態
  before_action :authenticate_user!
  before_action :find_user, only: [:index, :new]


  def create
    @message = current_user.messages.new(message_params)

    unless @message.save
      render js: "alert('留言失敗, 內容不可空白')"
    end

    mine = ApplicationController.render(
      partial: 'messages/mymessage',
      locals: { message: @message }
    )

    theirs = ApplicationController.render(
      partial: 'messages/message',
      locals: { message: @message }
    )
    
    ActionCable.server.broadcast "room_channel_#{@message.talkroom}", theirs: theirs, mine: mine, user: current_user.id

  end

  def new
    currentid = current_user.id
    userid = @user.id
    if currentid<userid
      @talkroom = "#{currentid} and #{userid}"
    else
      @talkroom = "#{userid} and #{currentid}"
    end
    @messages = Message.where(talkroom: @talkroom).order(created_at: :desc)
    @message = current_user.messages.new
    # render json: @talkroom
  end

  def show
    currentid = current_user.id
    userid = params[:id].to_i
    if currentid<userid
      @talkroom = "#{currentid} and #{userid}"
    else
      @talkroom = "#{userid} and #{currentid}"
    end
    @message = current_user.messages.new
    @messages = Message.where(talkroom: @talkroom ).includes(:user)
    @users = Message.where(foruser: current_user.id).select(:user_id).distinct
    @user = User.find(params[:id])
    # render json: @user
  end

  def index
    @messages = Message.where(foruser: @user).order(created_at: :desc).includes(:user)
    @users = Message.where(foruser: current_user.id).select(:user_id).distinct
    # render json: params
  end

  private
  #接收資料
  def message_params
    params.require(:message).permit(:content, :foruser ,:talkroom)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
