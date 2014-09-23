class SpaceRequestsController < ApplicationController

  def new
    @space_request = SpaceRequest.new
  end

  def create
    @space_request = SpaceRequest.new(space_request_params)
    respond_to do |format|
      if @space_request.save
        format.html { redirect_to spaces_path, notice: 'SpaceRequest was successfully submitted.' }
      else
        format.html { render :new }
      end
    end
  end



  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_request_params
      params.require(:space_request).permit(:size, :city, :budget, :email)
    end

end

