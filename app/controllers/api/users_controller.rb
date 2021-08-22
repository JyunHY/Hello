class Api::UsersController < Api::BaseController
  before_action :find_user
  def subscribe
    render json: {status: current_user.subscribe!(@user)}
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end

