class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email)
    end

end
