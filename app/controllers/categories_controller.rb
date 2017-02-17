class CategoriesController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy] 
  
  def index
    @category = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def show
  end
  
  def create
    @category = Category.new(post_params)
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
    @category.destroy
    redirect_to root_path
  end
  
  def about
    
  end
  
  private
  
  def find_post
    @category = Category.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:т, :content)
  end
  
end

