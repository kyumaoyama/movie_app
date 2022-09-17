class PostsController < ApplicationController
  before_action :set_item,only:[:edit,:show,:update,:destroy]
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(test_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end
  private

  def test_params
    params.require(:post).permit(:text, :image,:category_id,:name,:rebyu).merge(user_id: current_user.id)
  end

  def set_item
    @post = Post.find(params[:id])
   end
end
