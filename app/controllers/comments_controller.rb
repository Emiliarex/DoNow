class CommentsController < ApplicationController
   def new
   
  end
  
  def create
    @category = Category.find(params[:category_id])
    @todo = Todo.find(params[:todo_id])
    @step = Step.find(params[:step_id])
    @comments = @step.comments
    
    @comment = current_user.comments.build(comment_params)
    @comment.step = @step
    @new_comment = Comment.new
    
    
    if @comment.save
      flash[:notice] = "Comment successfully created"
    
    else
      flash[:error] = "Comment exploded"
     
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def destroy
    @category = Category.find(params[:category_id])
    @todo = Todo.find(params[:todo_id])
    @step = Step.find(params[:step_id])
    @comment = @step.comments.find(params[:id])
    
    if @comment.destroy
      flash[:notice] = "Comment was removed"
     
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end

  

