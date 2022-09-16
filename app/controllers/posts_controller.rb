class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  private

  def test_params
    params.require(:post).permit(:text, :image)
  end
end
