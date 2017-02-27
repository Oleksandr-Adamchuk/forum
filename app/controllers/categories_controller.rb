class CategoriesController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy] 
  
  def index
    @categories = Category.paginate(page: params[:page])
  end
  
  def new
    @category = Category.new
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def create
    if signed_in?
    @category = current_user.categories.build(post_params)
      if @category.save!
        
        flash[:notice] = "Successfully created category."
       redirect_to @category
      end
    else
      render '/sessions/new'
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
    params.require(:category).permit(:title)
  end
  
end

