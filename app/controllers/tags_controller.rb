class TagsController < ApplicationController
  
  def create
    @tag = Tag.new(tag_params)
    @post = Post.find(@tag.post_id)
    if !@tag.save
      flash[:errors] = @tag.errors.full_messages
    end
    redirect_to post_url(@post)
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @post = Post.find(@tag.post_id)
    @tag.destroy
    redirect_to post_url(@post)
  end
  
  def tag_params
    params.require(:tag).permit(:body, :post_id)
  end
end
