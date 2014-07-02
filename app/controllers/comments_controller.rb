class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @link = Link.find(@comment.link_id)
    if !@comment.save
      flash[:errors] = @comment.errors.full_messages
    end
      redirect_to link_url(@link)
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @link = Link.find(@comment.link_id)
    @comment.destroy
    redirect_to link_url(@link)
  end
  
  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end
end
