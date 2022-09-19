class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to root_path  
    else
      redirect_back(fallback_location: root_path)  
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end

end

