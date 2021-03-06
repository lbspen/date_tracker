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

  def edit
    @daate = Daate.find(params[:id])
  end

  def update
    @daate = Daate.new(params[:daate])
    if @daate.update_attributes(params[:project])
      flash[:notice] = "Date has been updated."
      redirect_to @daate
    else
      flash[:alert] = "Date has not been updated."
      render :action => "edit"
    end
  end

   def destroy
    @daate = Daate.find(params[:id])
    @daate.destroy
    flash[:notice] = "Date has been deleted."
    redirect_to daates_path
  end

  def future
    @daates = Daate.all
    @daates.each do |daate|
      if Date.new(daate.year, daate.month, daate.day) < Date.today
        @daates.delete(daate)
      end
    end
    render :action => "index"
  end
end
