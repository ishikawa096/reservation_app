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
    @user = current_user

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
    sidebar_items
    @current_item = ["current-item", "not-current-item"]
  end

  def profile
    sidebar_items
    @current_item = ["not-current-item", "current-item"]
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :icon)
  end

  def sidebar_items
    @user = User.find(current_user.id)
    @sidebar = ["アカウント", "プロフィール"]
    @sidebar_url = ["account", "profile"]
  end
end
