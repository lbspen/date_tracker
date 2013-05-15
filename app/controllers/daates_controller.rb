class DaatesController < ApplicationController
  def index
    @daates = Daate.all
  end

  def new
    @daate = Daate.new
  end

  def create
    @daate = Daate.new(params[:daate])
    if @daate.save
      flash[:notice] = "Date has been created."
      redirect_to @daate
    else
      flash[:alert] = "Date has not been created."
      render :action => "new"
    end
  end

  def show
    @daate = Daate.find(params[:id])
  end
end
