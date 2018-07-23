class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email)
    end

end
