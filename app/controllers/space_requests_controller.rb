class SpaceRequestsController < ApplicationController

  before_filter :set_space_request, only: [:show]

  def new
    @space_request = SpaceRequest.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @space_request = SpaceRequest.new(space_request_params)
    respond_to do |format|
      if @space_request.save
        format.js
      else
        format.js { render :new }
      end
    end
  end

  def show

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_request_params
      params.require(:space_request).permit(:max_size, :min_size, :city, :budget, :email)
    end

    def set_space_request
      @space_request = SpaceRequest.find_by_id(params[:id])
    end

end

