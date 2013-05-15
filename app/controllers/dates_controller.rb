class DatesController < ApplicationController
  def index
  end

  def new
    @date = Date.new
  end
end
