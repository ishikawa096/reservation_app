class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     if @user.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :root
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if params[:profile_update]
        flash[:notice] = "プロフィールを更新しました"
        redirect_to profile_users_url
      elsif
        flash[:notice] = "ユーザー情報を更新しました"
        redirect_to account_users_url
      end
    elsif
      if params[:profile_update]
        render "profile"
        flash.now[:alert] = "プロフィールを更新できませんでした"
      elsif
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
