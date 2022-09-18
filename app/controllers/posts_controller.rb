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

  def edit
    if @post.user_id == current_user.id 
    else
      redirect_to root_path
    end
  end 

  def update
    @post.update(test_params)
    if @post.valid?
      redirect_to posts_path(@post)
  else
    render 'edit'
   end
  end
  private

  def test_params
    params.require(:post).permit(:text, :image,:category_id,:name,:rebyu).merge(user_id: current_user.id)
  end

  def set_item
    @post = Post.find(params[:id])
   end
end
