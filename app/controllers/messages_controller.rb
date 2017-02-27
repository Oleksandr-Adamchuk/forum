class MessagesController < ApplicationController
  
  # def index
  #   @message = Message.new(params[:id])
  #   redirect_to categories_path
  # end
  
  def create
    @category = Category.find(params[:category_id])
    @message = @category.messages.build(comment_params)
    @message.user_id = current_user.id
    @message.save!
    redirect_to category_path(@category)
  end
  
  def new
    
  end
  
#   def destroy
#   @article = Article.find(params[:article_id])
#   @comment = @article.comments.find(params[:id])
#   @comment.destroy

#   redirect_to article_path(@article)
# end

 
  private
    def comment_params
      params.require(:message).permit(:body)
    end
end
