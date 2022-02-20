class UsersController < ApplicationController
  def index
    @users = User.all
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
    @user = current_user

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :root
    else
      render "edit"
    end
  end

  def destroy
  end

  def account
    @user = current_user
  end

  def profile
    @user = current_user

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :icon)
  end
end
