class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_search
  before_filter :set_last_five_requested_spaces
  protect_from_forgery with: :exception


  private

  def set_search
    @q = Space.ransack(params[:q])
  end

  def set_last_five_requested_spaces
    @requested_spaces = SpaceRequest.last(5)
  end
end
