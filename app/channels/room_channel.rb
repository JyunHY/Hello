class RoomChannel < ApplicationCable::Channel
  def subscribed
    # 登入或上線瞬間就開始訂閱
    stream_from "room_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
