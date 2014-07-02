class PostsController < ApplicationController
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_url
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end
  
  def index
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end
end
