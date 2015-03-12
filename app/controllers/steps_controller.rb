class StepsController < ApplicationController
  def new
    @step = Step.new
  end

  def edit
  end

  def show
    @step = Step.find(params[:id])
    
  end
end
