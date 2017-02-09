class PostsController < ApplicationController
  def index
    
  end
  
  def new
    @posts = Post.new
  end
  
  def create
    @posts = Post.new(post_params)
  end
  
  
  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
  
end
