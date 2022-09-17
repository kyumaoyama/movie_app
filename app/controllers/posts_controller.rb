class PostsController < ApplicationController
  def index
    @posts = Post.all
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

  private

  def test_params
    params.require(:post).permit(:text, :image,:category_id,:name,:rebyu).merge(user_id: current_user.id)
  end
end
