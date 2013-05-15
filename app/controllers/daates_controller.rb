class DaatesController < ApplicationController
  def index
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

    end
  end

  def show
    @daate = Daate.find(params[:id])
  end
end
