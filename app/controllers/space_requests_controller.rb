class SpaceRequestsController < ApplicationController

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



  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_request_params
      params.require(:space_request).permit(:max_size, :min_size, :city, :budget, :email)
    end

end

