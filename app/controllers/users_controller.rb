class UsersController < ApplicationController

  def new
    @user = User.find(params[:id])
    @user = User.new
end

  def index
    @users = User.all
  end

  def create
    @user = User.find(params[:id])
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      redirect_to root_path
    else
      
      render :new
      
    end
  end

  def show
     @user = User.find(params[:id])
    @nickname = current_user.nickname
    @posts = current_user.posts
  end

  def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to root_path
  else
    render :edit
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :avatar)
end
end

