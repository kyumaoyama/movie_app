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
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
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
      redirect_to root_path(@post)
  else
    render 'edit'
   end
  end

  def destroy
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to root_path
    else
      redirect_to root_path 
    end
  end
  private

  def test_params
    params.require(:post).permit(:image,:category_id,:name,:rebyu,:star).merge(user_id: current_user.id)
  end

  def set_item
    @post = Post.find(params[:id])
   end
end
