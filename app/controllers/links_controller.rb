class LinksController < ApplicationController
  
  before_action :require_signed_in
  
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end
  
  def index
    
  end
  
  def show
    @link = Link.find(params[:id])
  end
  
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_url
  end
  
  def edit
    @link = Link.find(params[:id])
  end
  
  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end
  
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
