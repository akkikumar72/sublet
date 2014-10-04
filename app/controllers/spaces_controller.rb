class SpacesController < ApplicationController

  before_action :set_space, only: [:show, :destroy]
  before_action :find_to_destroy, only: [:remove, :destroy]

  def index
    @spaces = @q.result.includes(:images).paginate(per_page: 10, page: params[:page])
  end

  def show
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    respond_to do |format|
      if @space.save
        format.html { redirect_to @space, notice: 'Space was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def remove
  end

  def destroy
    @space.mark_as_inactive
    flash[:notice] = "Your listing has been removed."
    redirect_to spaces_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.friendly.find(params[:id])
      redirect_to root_path unless @space.present?
    end

    # Use callbacks to share common setup or constraints between actions.
    def find_to_destroy
      @space = Space.find_by_removal_token(params[:id])
      redirect_to root_path unless @space.present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_params
      params.require(:space).permit(:title, :price, :size, :description, :address, :zipcode, :email, :active, :q, images_attributes: [:id, :file, :space_id])
    end

end
