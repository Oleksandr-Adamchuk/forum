class MessagesController < ApplicationController
  
  def create
    @category = Category.find(params[:category_id])
    @message = @category.messages.build(comment_params)
    @message.user_id = current_user.id
    @message.save!
    redirect_to category_path(@category)
  end
  
  def new
    
  end
 
  private
    def comment_params
      params.require(:message).permit(:body)
    end
end
