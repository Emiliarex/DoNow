class StepsController < ApplicationController
  def new
    @step = Step.new
  end

  def edit
  end

  def show
    @step = Step.find(params[:id])
    
  end
  
  def complete
    @step = Step.find(params[:id])
    if @step.completed == false
      @step.update_attribute(:completed, true)
      flash[:notice] = "Step Completed"
    else
      @step.update_attribute(:completed, false)
      flash[:notice] = "Step Uncompleted"
    end
    redirect_to :back
  end
end
