class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy] 
  
  def index
  end
  
  def new
    @category = Post.new
  end
  
  def show
  end
  
  def create
    @category = Post.new(post_params)
    if @category.save
      redirect_to @category
      
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @category.update(post_params)
      redirect_to @category
    else 
      render 'edit'
    end  
  end
  
  def destroy
    category.destroy
    redirect_to root_path
  end
  
  
  private
  
  def find_post
    @category = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :content)
  end
  
end
