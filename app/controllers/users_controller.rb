class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if params[:profile_update]
        flash[:notice] = "プロフィールを更新しました"
        redirect_to profile_users_url
      else
        flash[:notice] = "ユーザー情報を更新しました"
        redirect_to account_users_url
      end
    elsif
      if params[:profile_update]
        render "profile"
        flash.now[:alert] = "プロフィールを更新できませんでした"
      else
        render "account"
        flash.now[:alert] = "ユーザー情報を更新できませんでした"
      end
    end
  end

  def destroy
  end

  def account
    @user = User.find(current_user.id)
  end

  def profile
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :icon)
  end
end
